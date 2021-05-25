namespace LevelUpBackEnd.Dto
{
    public class ValidateAnswerResponse
    {
        public bool Result { get; set; }
        public string Message { get; set; }
        public bool IsAllLevelsCompleted { get; set; }
    }
}
