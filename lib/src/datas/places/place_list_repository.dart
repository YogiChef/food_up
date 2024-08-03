import 'package:move_on/src/datas/places/place_list_decodable.dart';
import 'package:move_on/src/datas/places/places_manager.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

class DefaultPlaceListRepository extends PlaceListRepository {
  final PlaceManager _placeManager;

  DefaultPlaceListRepository({PlaceManager? listManage})
      : _placeManager = listManage ?? DefaultPlaceManager();

  @override
  Future<PlaceListDecodable> fetchNoveltyPlaceList() {
    return _placeManager.fetchNoveltyPlaceList();
  }

  @override
  Future<PlaceListDecodable> fetchPlaceList() {
    return _placeManager.fetchPlaceList();
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByCategory(
      {required int categoryId}) {
    return _placeManager.fetchPlaceListByCategory(categoryId: categoryId);
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByQuery({required String query}) {
    return _placeManager.fetchPlaceListByQuery(query: query);
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByRecentSearches(
      {required List<String> placeIds}) {
    return _placeManager.fetchPlaceListByRecentSearches(placeIds: placeIds);
  }

  @override
  Future<PlaceListDecodable> fetchPopularPlaceList() {
    return _placeManager.fetchPopularPlaceList();
  }
}
