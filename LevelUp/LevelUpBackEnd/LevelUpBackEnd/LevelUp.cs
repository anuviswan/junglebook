using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
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
        public static async Task<HttpResponseMessage> GetNextQuestion(
            [HttpTrigger(AuthorizationLevel.Function, nameof(HttpMethods.Post), Route = null)] HttpRequest req,
            [Table(Utils.Table_Name, Utils.Key_Partition, Utils.Key_User)] KeyTableEntity keyTable,
            [Table(Utils.Table_Name)] CloudTable tableEntity,
            [Blob(Utils.Blob_Container_Name)] CloudBlobContainer blobContainer,
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
            var userQuery = new TableQuery<UserEntity>();
            userQuery.FilterString = TableQuery.GenerateFilterCondition(nameof(UserEntity.UserName), QueryComparisons.Equal, data.UserName);
            var tableContinuation = default(TableContinuationToken);
            var userResponse = await tableEntity.ExecuteQuerySegmentedAsync(userQuery,tableContinuation);
            var currentLevel = 1;

            if (userResponse.Results.Count == 0)
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
            else
            { 
                currentLevel = userResponse.Results.First().Level; 
            }

            var questionQuery = new TableQuery<QuestionEntity>();
            questionQuery.FilterString = TableQuery.CombineFilters(TableQuery.GenerateFilterConditionForInt(nameof(QuestionEntity.Level), QueryComparisons.Equal, currentLevel),
                                                                   TableOperators.And,
                                                                   TableQuery.GenerateFilterCondition(nameof(QuestionEntity.PartitionKey), QueryComparisons.Equal, Utils.Key_Question));
            var questionContinuation = default(TableContinuationToken);
            var questionResponse = await tableEntity.ExecuteQuerySegmentedAsync(questionQuery, questionContinuation);

            var blocReference = blobContainer.GetBlockBlobReference(questionResponse.First().Question);

            using(var memStream = new MemoryStream())
            {
                await blocReference.DownloadToStreamAsync(memStream);
                HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
                response.Content = new StreamContent(memStream);
                response.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("image/jpg");
                return response;
            }
            //return new OkObjectResult(finalResult);
        }

        private static byte[] ImageToByteArray(Image image)
        {
            ImageConverter converter = new ImageConverter();
            return (byte[])converter.ConvertTo(image, typeof(byte[]));
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

            blobContainer.CreateIfNotExists();
            var fileExtension = new FileInfo(fileToUpload.FileName).Extension;
            var blobReference = default(CloudBlockBlob);

            using (var stream = fileToUpload.OpenReadStream())
            {
                var fileName = $"{Guid.NewGuid()}{fileExtension}";
                blobReference = blobContainer.GetBlockBlobReference(fileName);
                await blobReference.UploadFromStreamAsync(stream);
            }


            await tableEntity.CreateIfNotExistsAsync();

            var itemId = await tableEntity.GetNewKey(keyTable);
            var item = new QuestionEntity
            {
                PartitionKey = Utils.Key_Question,
                RowKey = itemId.ToString(),
                Answer = data.Answer,
                Level = data.Level,
                Url = blobReference.Uri.ToString(),
                Question = blobReference.Name
            };

            var addOperation = TableOperation.Insert(item);
            var _ = await tableEntity.ExecuteAsync(addOperation);
            return new OkObjectResult(new { Path = blobReference.Uri, QuestionId = itemId });
        }


    }
}
