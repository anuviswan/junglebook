class BirdManager
{
  List<String> _birds = [
    "flamingo",
    "toucan",
    'kingfisher',
    'macaw',
    'owl',
    'parrot',
    'reedling',
    'penguin'];

  List<String> getList(int count)
  {
    _birds.shuffle();
    var startIndex = 1;
    var returnList = _birds.sublist(startIndex,startIndex+count);
    return returnList;
  }
}