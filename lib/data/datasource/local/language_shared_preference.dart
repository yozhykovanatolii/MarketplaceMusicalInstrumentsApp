import 'package:shared_preferences/shared_preferences.dart';

class LanguageSharedPreference {
  final _sharedPreferences = SharedPreferences.getInstance();

  Future<String> loadLanguageCode() async {
    final languageCode =
        (await _sharedPreferences).getString('languageCode') ?? 'en';
    return languageCode;
  }

  Future<void> saveLanguageCode(String languageCode) async {
    (await _sharedPreferences).setString('languageCode', languageCode);
  }
}
