using Microsoft.Azure.Cosmos.Table;
using System;
using System.Collections.Generic;
using System.Text;

namespace LevelUpBackEnd.Entities
{
    public class QuestionEntity:TableEntity
    {
        public int Level { get; set; }
        public string Answer { get; set; }
        public string Url { get; set; }
        public string Question { get; set; }
    }
}
