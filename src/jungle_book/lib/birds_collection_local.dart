import 'package:jungle_book/fauna_meta_data.dart';
import 'fauna_collection_base.dart';
import 'dart:io';

class BirdsLocalCollection extends FaunaCollectionBase
{
  @override
  List<FaunaMetaData> GetList ()  {

    new File('assets/database/birds.json').readAsString().then((String contents) {
      print(contents);});

    print('soimething is wrong');
    return null;
  }
}
