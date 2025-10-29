import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreference {
  final _sharedPreferences = SharedPreferences.getInstance();

  Future<bool> loadThemeMode() async {
    final isDarkMode =
        (await _sharedPreferences).getBool('isDarkMode') ?? false;
    return isDarkMode;
  }

  Future<void> saveThemeMode(bool isDarkMode) async {
    (await _sharedPreferences).setBool('isDarkMode', isDarkMode);
  }
}
