class FaunaMetaData
{
  String name;
  String imageFilePath;
  String cryAudioFilePath;
  String pronunciationFilePath;

  FaunaMetaData.fromJson(Map<String,dynamic> json){
    print('here');
    name = json['name'];
    imageFilePath = json['image'];
    cryAudioFilePath = json['audio'];
    pronunciationFilePath = json['pronunciation'];
  }
}

