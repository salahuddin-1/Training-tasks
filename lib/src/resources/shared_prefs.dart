import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static final _prefs = SharedPreferences.getInstance();

  Future<bool> storePrefs({required String email, required String pass}) async {
    final prefs = await _prefs;
    bool success = false;

    try {
      prefs.setBool('isLoggedIn', true);
      prefs.setString('email', email);
      prefs.setString('password', pass);
      success = true;
    } catch (e) {
      print(e.toString());
    }

    return success;
  }

  Future<Map<String, String>> getPrefs() async {
    Map<String, String> map = {};

    final prefs = await _prefs;

    bool isLoggedIn = prefs.getBool('isLoggedIn')!;

    if (isLoggedIn) {
      map = {
        'email': prefs.getString('email')!,
        'password': prefs.getString('password')!,
      };
    }

    return map;
  }

  Future<bool> clearPrefs() async {
    final prefs = await _prefs;

    return await prefs.clear();
  }
}
