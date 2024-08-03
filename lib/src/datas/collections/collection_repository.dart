import 'package:move_on/src/datas/collections/collection_decodable.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/interfaces.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/realtime_datbase_service.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

class DefaultCollectionsRepository extends CollectionsRepository {
  String path = 'collections/';

  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultCollectionsRepository(
      {RealtimeDatabaseService? realtimeDatabaseService})
      : _realtimeDatabaseService =
            realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<CollectionDecodable> fetcCollections() async {
    final response = await _realtimeDatabaseService.getData(path: path);
    return CollectionDecodable.fromMap(response);
  }
}
