import 'package:move_on/src/datas/collections/collection_entity.dart';
import 'package:move_on/src/datas/collections/collection_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class FetchCollectionUseCase {
  Future<CollectionEntity> execute();
}

class DefaultFetchCollectionUseCase extends FetchCollectionUseCase {
  final CollectionsRepository _collectionsRepository;

  DefaultFetchCollectionUseCase({CollectionsRepository? collectionsRepository})
      : _collectionsRepository =
            collectionsRepository ?? DefaultCollectionsRepository();

  @override
  Future<CollectionEntity> execute() async {
    final decodable = await _collectionsRepository.fetcCollections();
    return CollectionEntity.fromMap(decodable.toMap());
  }
}
