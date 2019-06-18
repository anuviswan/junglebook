class PathManager {

  String GetImagePath(String animalKey){
    return 'images/$animalKey.jpg';
  }

  String GetBirdCryPath(String animalKey){
    return '$animalKey.mp3';
  }
}