using System;

namespace LevelUpBackEnd.Dto
{
    public class NextClueResponse
    {
        public bool HasClue { get; set; }
        public int ClueId { get; set; }
        public string Description { get; set; }

        public TimeSpan TimeRemaining { get; set; }
    }
}
