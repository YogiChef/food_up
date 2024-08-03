abstract class BaseRealTimeDatabaseService {
  String baseUrl = "https://food-up-5abbc-default-rtdb.firebaseio.com/";
  String adminToken = 'AIzaSyBnr1I_xE9OxQPGqHMthLyGQzGCEtyDHF8';
  String endUrl = ".json";
}

abstract class RealtimeDatabaseService extends BaseRealTimeDatabaseService {
  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> bodyParameters, required String path});
  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParameters, required String path});
  Future<Map<String, dynamic>> getData({required String path});
}
