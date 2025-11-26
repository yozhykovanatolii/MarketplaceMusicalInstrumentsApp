import 'package:marketplace_musical_instruments_app/data/datasource/local/settings_shared_preference.dart';

class SettingsRepository {
  final _settingsSharedPreference = SettingsSharedPreference();

  Future<bool> loadThemeMode() async =>
      _settingsSharedPreference.loadThemeMode();

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _settingsSharedPreference.saveThemeMode(isDarkMode);
  }

  Future<String> loadLanguageCode() async {
    return await _settingsSharedPreference.loadLanguageCode();
  }

  Future<void> saveLanguageCode(String languageCode) async {
    await _settingsSharedPreference.saveLanguageCode(languageCode);
  }
}
