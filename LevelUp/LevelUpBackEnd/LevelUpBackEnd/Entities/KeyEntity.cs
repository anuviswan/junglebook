using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Entities
{
    public class KeyTableEntity : TableEntity
    {
        public int Value { get; set; }
    }
}
