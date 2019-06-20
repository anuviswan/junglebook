abstract class BaseDictionary{
  String getImageFilePath(String key);
  String getCryAudioFilePath(String key);
  String getPronunciationAudioFilePath(String key);
}

class BirdsLocalDictionary extends BaseDictionary{
  BirdsLocalDictionary():super();

  @override
  getImageFilePath (String key)=> 'images/birds/$key.jpg';

  @override
  getCryAudioFilePath(String key)=> '$key.mp3';

  @override
  getPronunciationAudioFilePath(String key)=> '';
}

