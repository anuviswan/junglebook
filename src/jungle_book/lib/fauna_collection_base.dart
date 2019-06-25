import 'fauna_meta_data.dart';

abstract class FaunaCollectionBase
{
  Future<List<FaunaMetaData>> GetList();
}

