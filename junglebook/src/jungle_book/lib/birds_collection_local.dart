import 'fauna_collection_base.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'fauna_meta_data.dart';
import 'dart:convert';

class BirdsLocalCollection extends FaunaCollectionBase {
  @override
  Future<List<FaunaMetaData>> GetList() async{
    var data = await readFile();
    final jsonResponse= jsonDecode(data);

    print('Json data $jsonResponse');
    List<FaunaMetaData> faunaCollection =  (jsonResponse as List)
        .map((p) => FaunaMetaData.fromJson(p))
        .toList();

    faunaCollection.forEach((item)=>
      print('name=${item.name},image=${item.imageFilePath}')
    );
    return faunaCollection;
  }


  Future<String> readFile() async {
    return await rootBundle.loadString('assets/database/birds.json');
  }
}

