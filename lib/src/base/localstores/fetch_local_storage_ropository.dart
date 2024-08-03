import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultFetchLocalStorageRepository extends FetchLocalStorageRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Future<String?> fetchInLocalStorage({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<List<String>?> fetchRecentSearches() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(LocalStorageKeys.recentSearches);
  }
}
