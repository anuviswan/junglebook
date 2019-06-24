import 'fauna_collection_base.dart';
import 'package:flutter/services.dart' show rootBundle;

class BirdsLocalCollection extends FaunaCollectionBase {
  @override
  Future<List<String>> GetList() async{
    var data = await readFile();
    return [data];
  }


  Future<String> readFile() async {
    return await rootBundle.loadString('assets/database/birds.json');
  }
}

