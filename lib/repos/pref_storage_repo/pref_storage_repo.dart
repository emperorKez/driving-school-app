import 'package:shared_preferences/shared_preferences.dart';

class PrefStorageRepo {
  PrefStorageRepo(this.prefs);

  static const firstTimePref = 'firstTimePref';

  SharedPreferences prefs;

  Future<void> saveData(String key, String value) async {
    await prefs.setString(key, value);
  }

  String? getData(String key) {
    return prefs.getString(key);
  }

  void removeData(String key) {
    prefs.remove(key);
  }
}
