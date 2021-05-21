using System;
using System.Collections.Generic;
using System.Text;

namespace LevelUpBackEnd.Dto
{
    public class ValidateAnswerRequest
    {
        public string UserName { get; set; }
        public string Answer { get; set; }
        public int Level { get; set; }
    }
}
