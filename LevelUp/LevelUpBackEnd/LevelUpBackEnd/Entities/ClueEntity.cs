using Microsoft.Azure.Cosmos.Table;

namespace LevelUpBackEnd.Entities
{
    public class ClueEntity :TableEntity
    {
        public int QuestionId { get; set; }
        public string ClueDescription { get; set; }
        public int ClueNumber { get; set; }
    }
}
