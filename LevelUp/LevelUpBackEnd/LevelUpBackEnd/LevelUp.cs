using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using LevelUpBackEnd.Dto;
using LevelUpBackEnd.Entities;
using LevelUpBackEnd.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Cosmos.Table;
using Microsoft.Azure.Storage.Blob;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace LevelUpBackEnd
{
    public static class LevelUp
    {
        [FunctionName(Utils.FunctionName_GetNextQuestion)]
        public static async Task<IActionResult> GetNextQuestion(
            [HttpTrigger(AuthorizationLevel.Function, nameof(HttpMethods.Post), Route = null)] HttpRequest req,
            [Table(Utils.Table_Name, Utils.Key_Partition, Utils.Key_User)] KeyTableEntity keyTable,
            [Table(Utils.Table_Name)] CloudTable tableEntity,
            ILogger log)
        {
            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var data = JsonConvert.DeserializeObject<NextQuestionRequest>(requestBody);

            log.LogInformation($"{Utils.FunctionName_GetNextQuestion}:Request from {data.UserName}");

            if (keyTable == null)
            {
                keyTable = await tableEntity.InitialiazeKeyPartition(Utils.Key_User);
            }

            await tableEntity.CreateIfNotExistsAsync();
            var query = new TableQuery<UserEntity>();
            query.FilterString = TableQuery.GenerateFilterCondition(nameof(UserEntity.UserName), QueryComparisons.Equal, data.UserName);
            var tableContinuation = default(TableContinuationToken);
            var response = await tableEntity.ExecuteQuerySegmentedAsync(query,tableContinuation);

            if (response.Results.Count == 0)
            {
                var itemId = await tableEntity.GetNewKey(keyTable);
                var item = new UserEntity
                {
                    PartitionKey = Utils.Key_User,
                    RowKey = itemId.ToString(),
                    UserName = data.UserName,
                    Level = 1,
                    LastUpdated = DateTime.Now
                };

                var addOperation = TableOperation.Insert(item);
                var addResponse = await tableEntity.ExecuteAsync(addOperation);
            }

            string responseMessage = "User Found";

            return new OkObjectResult(responseMessage);
        }


        [FunctionName(Utils.FunctionName_GetScores)]
        public static async Task<IActionResult> GetScores(
            [HttpTrigger(AuthorizationLevel.Function, nameof(HttpMethods.Post), Route = null)] HttpRequest req,
            
            [Table(Utils.Table_Name)] CloudTable tableEntity,
            ILogger log)
        {
            await tableEntity.CreateIfNotExistsAsync();
            var query = new TableQuery<UserEntity>();
            query.FilterString = TableQuery.GenerateFilterCondition(nameof(UserEntity.PartitionKey), QueryComparisons.Equal, Utils.Key_User);
            var tableContinuation = default(TableContinuationToken);
            var response = await tableEntity.ExecuteQuerySegmentedAsync(query, tableContinuation);

            var results = response.Results;

            var sortedfResults = results.OrderByDescending(x => x.Level)
                                        .ThenByDescending(x => x.LastUpdated)
                                        .Select((x,index)=> new 
                                        {
                                            UserName = x.UserName,
                                            Level = x.Level,
                                            Rank = index + 1
                                        });
            return new OkObjectResult(sortedfResults);
        }


        [FunctionName(Utils.FunctionName_CreateQuestion)]
        public static async Task<IActionResult> CreateQuestion(
            [HttpTrigger(AuthorizationLevel.Function, nameof(HttpMethods.Post), Route = null)] HttpRequest req,
            [Table(Utils.Table_Name, Utils.Key_Partition, Utils.Key_Question)] KeyTableEntity keyTable,
            [Table(Utils.Table_Name)] CloudTable tableEntity,
            [Blob(Utils.Blob_Container_Name)] CloudBlobContainer blobContainer,
            ILogger log)
        {

            var fileToUpload = req.Form.Files["file"];
            var data = new QuestionEntity
            {
                Answer = req.Form["answer"],
                Level = Int32.Parse(req.Form["level"])
            };
            
            if (keyTable == null)
            {
                keyTable = await tableEntity.InitialiazeKeyPartition(Utils.Key_Question);
            }


            await tableEntity.CreateIfNotExistsAsync();

            var itemId = await tableEntity.GetNewKey(keyTable);
            var item = new QuestionEntity
            {
                PartitionKey = Utils.Key_Question,
                RowKey = itemId.ToString(),
                Answer = data.Answer,
                Level = data.Level,
            };

            var addOperation = TableOperation.Insert(item);
            var _ = await tableEntity.ExecuteAsync(addOperation);

            blobContainer.CreateIfNotExists();
            var fileExtension = new FileInfo(fileToUpload.FileName).Extension;

            using (var stream = fileToUpload.OpenReadStream())
            {
                var fileName = $"{itemId}.{fileExtension}";
                var blobReference = blobContainer.GetBlockBlobReference(fileName);
                await blobReference.UploadFromStreamAsync(stream);
                return new OkObjectResult(new { Path = blobReference.Uri, QuestionId = itemId });
            }
        }


    }
}
