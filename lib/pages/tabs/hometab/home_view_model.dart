import 'package:move_on/src/datas/collections/collection_entity.dart';
import 'package:move_on/src/datas/collections/collection_usecase.dart';
import 'package:move_on/src/datas/places/place_list_entity.dart';
import 'package:move_on/src/datas/places/place_list_usecase.dart';

enum HomeViewModelState { viewLoadedState, errorState }

abstract class HomeViewModelInput {
  Future<HomeViewModelState> viewInitState();
  List<PlaceDetailEntity> noveltyPlaces = [];
  List<PlaceDetailEntity> popularPlaces = [];
  List<CollectionDetailEntity> collections = [];
}

abstract class HomeViewModel extends HomeViewModelInput {}

class DefaultHomeViewModel extends HomeViewModel {
  final PlaceListUseCase _placeListUseCase;
  final FetchCollectionUseCase _collectionUseCase;

  DefaultHomeViewModel(
      {PlaceListUseCase? placeListUseCase,
      FetchCollectionUseCase? collectionUseCase})
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _collectionUseCase =
            collectionUseCase ?? DefaultFetchCollectionUseCase();

  @override
  Future<HomeViewModelState> viewInitState() async {
    final noveltyPlacesResult = await _placeListUseCase.fetchNoveltyPlaceList();
    noveltyPlaces = noveltyPlacesResult.placeList ?? [];

    final popularPlacesResult = await _placeListUseCase.fetchPopularPlaceList();
    popularPlaces = popularPlacesResult.placeList ?? [];

    final collectionsResponse = await _collectionUseCase.execute();
    collections = collectionsResponse.collections ?? [];

    if (noveltyPlaces.isNotEmpty ||
        popularPlaces.isNotEmpty ||
        collections.isNotEmpty) {
      return HomeViewModelState.viewLoadedState;
    } else {
      return HomeViewModelState.errorState;
    }
  }
}
