import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultRemoveLocalStorageRepository extends RemoveLocalStorageRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> removeInLocalStorage({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
