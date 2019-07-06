class FaunaMetaData
{
  String name;
  String imageFilePath;
  String cryAudioFilePath;
  String pronunciationFilePath;
  String interestingFact;

  FaunaMetaData.fromJson(Map<String,dynamic> json){
    name = json['name'];
    imageFilePath = json['image'];
    cryAudioFilePath = json['audio'];
    pronunciationFilePath = json['pronunciation'];
    interestingFact = json['interestingFact'];
  }
}

