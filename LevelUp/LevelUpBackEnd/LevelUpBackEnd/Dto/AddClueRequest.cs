namespace LevelUpBackEnd.Dto
{
    public class AddClueRequest
    {
        public int QuestionId { get; set; }
        public int ClueLevel { get; set; }
        public string Description { get; set; }
    }
}
