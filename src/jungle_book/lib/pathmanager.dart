class PathManager {

  String GetImagePath(String animalKey){
    return 'images/birds/$animalKey.jpg';
  }

  String GetBirdCryPath(String animalKey){
    return '$animalKey.mp3';
  }
}

abstract class BaseDictionary{
  String getImageFilePath(String key);
  String getCryAudioFilePath(String key);
  String getPronunciationAudioFilePath(String key);
}