import 'birds_collection_local.dart';

abstract class BaseDictionary{
  String getName();
  String getImageFilePath(String key);
  String getCryAudioFilePath(String key);
  String getPronunciationAudioFilePath(String key);
  List<String> getList();
}

class BirdsLocalDictionary extends BaseDictionary{
  BirdsLocalDictionary():super();

  @override
  getName () => 'birds';

  @override
  getImageFilePath (String key)=> 'images/birds/$key.jpg';

  @override
  getCryAudioFilePath(String key)=> '$key.mp3';

  @override
  getPronunciationAudioFilePath(String key)=> '';

  @override
  getList(){
    var collection = new BirdsLocalCollection();
    var _birds = collection.GetList();

    _birds.shuffle();
    var startIndex = 1;
    var returnList = _birds.sublist(startIndex,_birds.length+1);
    return null;
  }


}



