import 'package:shared_preferences/shared_preferences.dart';


class StorageShared {
  static SharedPreferences? prefs;

  static initSP() async {
    prefs = await SharedPreferences.getInstance();
  }

  static save(String key, String value) {
    prefs?.setString(key, value);
  }

  static get(String key) {
    return prefs?.get(key);
  }

  static remove(String key) {
    prefs?.remove(key);
  }

  static getString(String key) {
    return prefs?.getString(key);
  }

  static setString(String key) {
    return prefs?.setString(key, "login");
  }
}