import 'package:hive/hive.dart';

class AppPrefs {
  static const String _boxName = "app_prefs";

  static Future<Box> _openBox() async {
    return await Hive.openBox(_boxName);
  }

  static Future<bool> isFirstTime() async {
    final box = await _openBox();
    return box.get("isFirstTime", defaultValue: true);
  }

  static Future<void> setFirstTimeFalse() async {
    final box = await _openBox();
    await box.put("isFirstTime", false);
  }

  static Future<String?> getLoggedInUser() async {
    final box = await _openBox();
    return box.get("loggedInUserEmail");
  }

  static Future<void> setLoggedInUser(String email) async {
    final box = await _openBox();
    await box.put("loggedInUserEmail", email);
  }

  static Future<void> logout() async {
    final box = await _openBox();
    await box.delete("loggedInUserEmail");
  }
}
