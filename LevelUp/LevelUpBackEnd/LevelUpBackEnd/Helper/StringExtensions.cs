using System;
using System.Text.RegularExpressions;

namespace LevelUpBackEnd.Helper
{
    public static class StringExtensions
    {
        public static bool CompareAnswer(this string source,string destination)
        {
            string normalizedSource = Regex.Replace(source, @"\s", "",RegexOptions.Compiled);
            string normalizedDestination = Regex.Replace(destination, @"\s", "",RegexOptions.Compiled);

            return String.Equals(
                normalizedSource,
                normalizedDestination,
                StringComparison.OrdinalIgnoreCase);
        }
    }
}
