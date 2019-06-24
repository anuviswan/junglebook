import 'package:jungle_book/fauna_meta_data.dart';
import 'fauna_collection_base.dart';
import 'dart:io';
import 'package:path/path.dart';

class BirdsLocalCollection extends FaunaCollectionBase {
  @override
  Future<List<String>> GetList() async{
    var data = await readFile('sds');
    print(data);
    print('soimething is wrong');
    return [data];
  }


  Future<String> readFile(String filePath) async {
    print('reading data...');
    new File(join(dirname(Platform.script.toFilePath()), '..', 'assets/database/birds.json')).readAsString().then((String contents)
    {
      print('data read');
      print('contents=$contents');
      return contents;
    });
  }
}

