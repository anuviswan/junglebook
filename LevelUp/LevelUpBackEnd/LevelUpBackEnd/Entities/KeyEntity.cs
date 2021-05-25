using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Entities
{
    public class KeyTableEntity : TableEntity
    {
        public int Value { get; set; }
    }
}
