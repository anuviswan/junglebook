import 'package:jungle_book/fauna_meta_data.dart';
import 'fauna_collection_base.dart';
import 'dart:io';

class BirdsLocalCollection extends FaunaCollectionBase
{
  @override
  List<FaunaMetaData> GetList() {
    var file = File('data.txt');
    return null;
  }

}