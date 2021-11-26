using System;
using System.Collections.Generic;

namespace LevelUpBackEnd.Dto
{
    public class NextClueResponse
    {
        public int CluesRemaining { get; set; }
        
        public IEnumerable<Clue> AvailableClues { get; set; }

        public TimeSpan TimeLeftForNextClue { get; set; }
    }

    public class Clue
    {
        public int ClueId { get; set; }
        public string Description { get; set; }
    }
}
