import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? _pref;

  static Future<void> get init async {
    _pref ??=  await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return _pref!.setBool(key, value);
    }
    if (value is String) {
      return _pref!.setString(key, value);
    }
    if (value is int) {
      return _pref!.setInt(key, value);
    } else {
      return _pref!.setDouble(key, value);
    }
  }

  static Future<dynamic> getData({required String key}) async {
    return _pref!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _pref!.remove(key);
  }
}
