import 'package:move_on/src/base/api_sevices/api_service.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = 'https://identitytoolkit.googleapis.com/v1/';
  static String adminToken = 'AIzaSyBnr1I_xE9OxQPGqHMthLyGQzGCEtyDHF8';
  static String signUpEndpoint = 'accounts:signUp?key=';
  static String signInEndpoint = 'accounts:signInWithPassword?key=';
  static String updatePasswordEndpoint = 'accounts:sendOobCode?key=';
  static String getUserDataEndpoint = 'accounts:lookup?key=';
  static String updateEmailEndpoint = 'accounts:update?key=';
}

abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signUpEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>>? signUp(
      {required Map<String, dynamic> bodyparameters});
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signInEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>>? signIn(
      {required Map<String, dynamic> bodyparameters});
  Future<String> getIdToken({required Map<String, dynamic> bodyparameters});
}

abstract class UpdatePasswordUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.updatePasswordEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updatePassword({required String email});
}

abstract class GetUserAuthDataService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.getUserDataEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> getUserAuthData(
      {required Map<String, dynamic> bodyparameters});
}

abstract class UpdateEmailUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.updateEmailEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updateEmail(
      {required String oldEmail,
      required String newEmail,
      required String password});
}
