import 'fauna_collection_base.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'fauna_meta_data.dart';
import 'dart:convert';

class BirdsLocalCollection extends FaunaCollectionBase {
  @override
  Future<List<String>> GetList() async{
    var data = await readFile();
    Map<String, dynamic> map = jsonDecode(data);
    var result = FaunaMetaData.fromJson(map);
    return [data];
  }


  Future<String> readFile() async {
    return await rootBundle.loadString('assets/database/birds.json');
  }
}

