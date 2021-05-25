using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Entities
{
    public class QuestionEntity:TableEntity
    {
        public int Level { get; set; }
        public string Answer { get; set; }
        public string Url { get; set; }
        public bool IsLastQuestion { get; set; }
    }
}
