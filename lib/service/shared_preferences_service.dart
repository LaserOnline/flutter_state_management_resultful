import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/Routes.dart';

class SharedPreferencesService {
  static Future<bool> getIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setIsLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }
}

class Remove {
  static Logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    Get.offAllNamed("/login");
  }
}
