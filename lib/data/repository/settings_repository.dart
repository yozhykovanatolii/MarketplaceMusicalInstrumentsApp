import 'package:marketplace_musical_instruments_app/data/datasource/local/language_shared_preference.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/local/theme_shared_preference.dart';

class SettingsRepository {
  final _themeSharedPreference = ThemeSharedPreference();
  final _languageSharedPreference = LanguageSharedPreference();

  Future<bool> loadThemeMode() async => _themeSharedPreference.loadThemeMode();

  Future<void> saveThemeMode(bool isDarkMode) async {
    await _themeSharedPreference.saveThemeMode(isDarkMode);
  }

  Future<String> loadLanguageCode() async {
    return await _languageSharedPreference.loadLanguageCode();
  }

  Future<void> saveLanguageCode(String languageCode) async {
    await _languageSharedPreference.saveLanguageCode(languageCode);
  }
}
