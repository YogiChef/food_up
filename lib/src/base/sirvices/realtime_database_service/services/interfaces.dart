import 'package:move_on/src/datas/collections/collection_decodable.dart';
import 'package:move_on/src/datas/places/place_list_decodable.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/login/sign_in_decodables.dart';
import 'package:move_on/auth/sign_up/sign_up_decodables.dart';
import 'package:move_on/auth/passwords/update_password_decodable.dart';
import 'package:move_on/auth/users/user_decodable.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/user_auth_data_decodable.dart';
import 'package:move_on/auth/login/sign_in_body_parameters.dart';
import 'package:move_on/auth/users/user_auth_data_repository_body_parameters.dart';
import 'package:move_on/auth/sign_up/sign_up_repository.dart';
import 'package:move_on/auth/users/user_body_parameters.dart';

abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params});
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email});
}

abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters parames});
}

abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters parameters});
}

abstract class UserAuthDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters});
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId});
}

abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({required String key, required String value});
  Future<void> saveRecentSearcInLocalStorage(
      {required String key, required List<String> value});
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({required String key});
  Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}

abstract class CollectionsRepository {
  Future<CollectionDecodable> fetcCollections();
}

abstract class PlaceListRepository {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlaceList();
  Future<PlaceListDecodable> fetchPlaceListByCategory(
      {required int categoryId});
  Future<PlaceListDecodable> fetchPlaceListByQuery({required String query});
  Future<PlaceListDecodable> fetchPlaceListByRecentSearches(
      {required List<String> placeIds});
}
