// ignore_for_file: prefer_final_fields

import 'package:move_on/src/datas/places/place_list_decodable.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_service.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/interfaces.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/realtime_datbase_service.dart';

abstract class PlaceManager {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlaceList();
  Future<PlaceListDecodable> fetchPlaceListByCategory(
      {required int categoryId});
  Future<PlaceListDecodable> fetchPlaceListByQuery({required String query});
  Future<PlaceListDecodable> fetchPlaceListByRecentSearches(
      {required List<String> placeIds});
}

class DefaultPlaceManager extends PlaceManager {
  String _placeListPath = "placeList";
  double _distanceRange = 10.0;

  final RealtimeDatabaseService _realtimeDatabaseService;
  final GeolocationService _geolocationService;
  final GeolocationHelperService _helperService;

  DefaultPlaceManager(
      {RealtimeDatabaseService? realtimeDatabaseService,
      GeolocationService? geolocationService,
      GeolocationHelperService? helperService})
      : _realtimeDatabaseService =
            realtimeDatabaseService ?? DefaultRealtimeDatabaseService(),
        _geolocationService = geolocationService ?? MockGeolocationService(),
        _helperService = helperService ?? DefaultGeolocationServiceHelper();

  @override
  Future<PlaceListDecodable> fetchPlaceList() async {
    try {
      final response =
          await _realtimeDatabaseService.getData(path: _placeListPath);
      final userPosition = await _geolocationService.getCurrentPosition();
      PlaceListDecodable decodable =
          _mapToPlaceListDecodable(response: response);
      decodable.placeList = _mapNearPlaceList(
        placeList: decodable.placeList ?? [],
        userLat: userPosition.value?.latitude ?? 0.0,
        userLng: userPosition.value?.longitude ?? 0.0,
      );
      return decodable;
    } on Failure catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<PlaceListDecodable> fetchNoveltyPlaceList() async {
    final fulPlaceList = await fetchPlaceList();
    fulPlaceList.placeList =
        _mapNoveltyPlaceList(placesList: fulPlaceList.placeList ?? []);
    return fulPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPopularPlaceList() async {
    final fulPlaceList = await fetchPlaceList();
    fulPlaceList.placeList =
        _mapPopularPlaceList(placesList: fulPlaceList.placeList ?? []);
    return fulPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByCategory(
      {required int categoryId}) async {
    final fulPlaceList = await fetchPlaceList();
    fulPlaceList.placeList = _mapPlaceListByCategory(
        placesList: fulPlaceList.placeList ?? [], categoryId: categoryId);
    return fulPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByQuery(
      {required String query}) async {
    final fulPlaceList = await fetchPlaceList();
    fulPlaceList.placeList = _mapPlaceListByQuery(
        placesList: fulPlaceList.placeList ?? [], query: query);
    return fulPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlaceListByRecentSearches(
      {required List<String> placeIds}) async {
    final fulPlaceList = await fetchPlaceList();
    fulPlaceList.placeList = _mapPlaceListByRecentSearches(
        placesList: fulPlaceList.placeList ?? [], placeIds: placeIds);
    return fulPlaceList;
  }
}

extension Mappers on DefaultPlaceManager {
  PlaceListDecodable _mapToPlaceListDecodable(
      {required Map<String, dynamic> response}) {
    List<PlaceList> placeList = [];
    response.forEach((key, value) {
      placeList.add(PlaceList.fromMap(value));
    });

    return PlaceListDecodable(placeList: placeList);
  }

  List<PlaceList> _mapNearPlaceList({
    required List<PlaceList> placeList,
    required double userLat,
    required double userLng,
  }) {
    List<PlaceList> placListFiltered = [];
    for (var place in placeList) {
      double distance = _helperService.getDistanceBetweenInKilometters(
          userLat, userLng, place.lat, place.long);
      if (distance <= _distanceRange && place.status == 'active') {
        placListFiltered.add(place);
      }
    }
    return placListFiltered;
  }

  List<PlaceList> _mapNoveltyPlaceList({required List<PlaceList> placesList}) {
    List<PlaceList> placesListfiltered = [];
    for (var place in placesList) {
      if (place.isNovelty) {
        placesListfiltered.add(place);
      }
    }
    return placesListfiltered;
  }

  List<PlaceList> _mapPopularPlaceList({required List<PlaceList> placesList}) {
    List<PlaceList> placesListfiltered = [];
    for (var place in placesList) {
      if (place.isPopularThisWeek) {
        placesListfiltered.add(place);
      }
    }
    return placesListfiltered;
  }

  List<PlaceList> _mapPlaceListByCategory(
      {required List<PlaceList> placesList, required int categoryId}) {
    List<PlaceList> placesListfiltered = [];
    for (var place in placesList) {
      if (place.collectionId == categoryId) {
        placesListfiltered.add(place);
      }
    }
    return placesListfiltered;
  }

  List<PlaceList> _mapPlaceListByQuery(
      {required List<PlaceList> placesList, required String query}) {
    List<PlaceList> placesListfiltered = [];
    for (var place in placesList) {
      if (query.isNotEmpty &&
          place.placeName.toLowerCase().contains(query.toLowerCase())) {
        placesListfiltered.add(place);
      }
    }
    return placesListfiltered;
  }

  List<PlaceList> _mapPlaceListByRecentSearches(
      {required List<PlaceList> placesList, required List<String> placeIds}) {
    List<PlaceList> placesListfiltered = [];

    for (var placeId in placeIds) {
      for (var place in placesList) {
        if (place.placeId == placeId) {
          placesListfiltered.add(place);
        }
      }
    }

    return placesListfiltered;
  }
}
