import 'package:move_on/src/datas/places/place_list_entity.dart';
import 'package:move_on/src/datas/places/place_list_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class PlaceListUseCase {
  Future<PlaceListEntity> fetchPlaceList();
  Future<PlaceListEntity> fetchNoveltyPlaceList();
  Future<PlaceListEntity> fetchPopularPlaceList();
  Future<PlaceListEntity> fetchPlaceListByCategory({required int categoryId});
  Future<PlaceListEntity> fetchPlaceListByQuery({required String query});
  Future<PlaceListEntity> fetchPlaceListByRecentSearches(
      {required List<String> placeIds});
}

class DefaultPlaceListUseCase extends PlaceListUseCase {
  final PlaceListRepository _placeListRepository;

  DefaultPlaceListUseCase({PlaceListRepository? placeListRepository})
      : _placeListRepository =
            placeListRepository ?? DefaultPlaceListRepository();

  @override
  Future<PlaceListEntity> fetchNoveltyPlaceList() async {
    final placeDecodable = await _placeListRepository.fetchNoveltyPlaceList();
    return PlaceListEntity.fromMap(placeDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlaceList() async {
    final placeDecodable = await _placeListRepository.fetchPlaceList();
    return PlaceListEntity.fromMap(placeDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlaceListByCategory(
      {required int categoryId}) async {
    final placeDecodable = await _placeListRepository.fetchPlaceListByCategory(
        categoryId: categoryId);
    return PlaceListEntity.fromMap(placeDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlaceListByQuery({required String query}) async {
    final placeDecodable =
        await _placeListRepository.fetchPlaceListByQuery(query: query);
    return PlaceListEntity.fromMap(placeDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPlaceListByRecentSearches(
      {required List<String> placeIds}) async {
    final placeDecodable = await _placeListRepository
        .fetchPlaceListByRecentSearches(placeIds: placeIds);
    return PlaceListEntity.fromMap(placeDecodable.toMap());
  }

  @override
  Future<PlaceListEntity> fetchPopularPlaceList() async {
    final placeDecodable = await _placeListRepository.fetchPopularPlaceList();
    return PlaceListEntity.fromMap(placeDecodable.toMap());
  }
}
