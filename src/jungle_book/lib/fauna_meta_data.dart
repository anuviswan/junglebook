class FaunaMetaData
{
  String name;
  String imageFilePath;
  String cryAudioFilePath;
  String pronunciationFilePath;
  String description;

  FaunaMetaData.fromJson(Map<String,dynamic> json){
    name = json['name'];
    imageFilePath = json['image'];
    cryAudioFilePath = json['audio'];
    pronunciationFilePath = json['pronunciation'];
    description = json['description'];
  }
}

