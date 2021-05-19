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
                    CurrentLevel = 1,
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

            var sortedfResults = results.OrderByDescending(x => x.CurrentLevel)
                                        .ThenByDescending(x => x.LastUpdated)
                                        .Select((x,index)=> new 
                                        {
                                            UserName = x.UserName,
                                            Level = x.CurrentLevel,
                                            Rank = index + 1
                                        });
            return new OkObjectResult(sortedfResults);
        }


    }
}
