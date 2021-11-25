using System;
using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Entities
{
    public class UserEntity : TableEntity
    {
        public string UserName { get; set; }
        public int Level { get; set; }
        public DateTime LastUpdated { get; set; }

        public int CurrentClue { get; set; } = 0;
    }
}
