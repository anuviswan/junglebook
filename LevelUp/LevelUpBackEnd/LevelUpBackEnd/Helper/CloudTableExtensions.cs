using System;
using System.Threading.Tasks;
using LevelUpBackEnd.Entities;
using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Helper
{
    public static class CloudTableExtensions
    {
        public static async Task<int> GetNewKey(this CloudTable tableEntity, KeyTableEntity keyTable)
        {
            var newKey = keyTable.Value + 1;
            await tableEntity.CreateIfNotExistsAsync();
            keyTable.Value = newKey;
            var updateKeyOperation = TableOperation.Replace(keyTable);
            await tableEntity.ExecuteAsync(updateKeyOperation);
            return newKey;
        }

        public static async Task<KeyTableEntity> InitialiazeKeyPartition(this CloudTable tableEntity, string rowKey)
        {
            var keyTable = new KeyTableEntity
            {
                PartitionKey = Utils.Key_Partition,
                RowKey = rowKey,
                Value = 1001,
                ETag = "*"
            };
            var addKeyOperation = TableOperation.Insert(keyTable);
            await tableEntity.ExecuteAsync(addKeyOperation);
            return keyTable;
        }


    }
}
