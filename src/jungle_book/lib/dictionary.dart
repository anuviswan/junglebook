abstract class BaseDictionary{
  String getImageFilePath(String key);
  String getCryAudioFilePath(String key);
  String getPronunciationAudioFilePath(String key);
  List<String> getList();
}

class BirdsLocalDictionary extends BaseDictionary{
  BirdsLocalDictionary():super();

  @override
  getImageFilePath (String key)=> 'images/birds/$key.jpg';

  @override
  getCryAudioFilePath(String key)=> '$key.mp3';

  @override
  getPronunciationAudioFilePath(String key)=> '';

  @override
  getList(){
    List<String> _birds = [
      "flamingo",
      "toucan",
      'kingfisher',
      'macaw',
      'owl',
      'parrot',
      'reedling',
      'penguin'];
    _birds.shuffle();
    var startIndex = 1;
    var returnList = _birds.sublist(startIndex,_birds.length+1);
    return returnList;
  }
}



