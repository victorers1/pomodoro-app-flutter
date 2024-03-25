import 'package:flutter/material.dart';
import 'package:pomodoro/enums/language_enum.dart';

import 'settings_service.dart';

/// The SettingsController uses the SettingsService to store and retrieve user
/// settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;
  late ThemeMode _themeMode;
  late Language _language;

  ThemeMode get themeMode => _themeMode;
  Language get language => _language;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.loadThemeMode();
    _language = await _settingsService.loadLanguage();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateLanguage(Language? newLanguage) async {
    if (newLanguage == null || newLanguage == _language) return;
    _language = newLanguage;
    notifyListeners();
    await _settingsService.updateLanguage(newLanguage);
  }
}
