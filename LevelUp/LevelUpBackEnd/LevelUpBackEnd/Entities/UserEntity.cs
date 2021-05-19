using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Entities
{
    public class UserEntity : TableEntity
    {
        public string UserName { get; set; }
        public int CurrentLevel { get; set; }
        public DateTime LastUpdated { get; set; }
    }
}
