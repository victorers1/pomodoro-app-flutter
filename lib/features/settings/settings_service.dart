import 'package:flutter/material.dart';
import 'package:pomodoro/enums/language_enum.dart';
import 'package:pomodoro/features/local_memory/i_local_memory_service.dart';

class SettingsService {
  final ILocalMemoryService localMemoryService;

  SettingsService({required this.localMemoryService});

  Future<ThemeMode> loadThemeMode() async {
    final lastSavedTheme = await localMemoryService.loadString(
      ILocalMemoryService.themeModeStoreKey,
    );
    return ThemeMode.values.byName(lastSavedTheme ?? ThemeMode.system.name);
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await localMemoryService.storeString(
      ILocalMemoryService.themeModeStoreKey,
      theme.name,
    );
  }

  Future<Language> loadLanguage() async {
    final lastSavedLanguage = await localMemoryService.loadString(
      ILocalMemoryService.languageStoreKey,
    );
    return Language.values.byName(lastSavedLanguage ?? Language.en.name);
  }

  Future<void> updateLanguage(Language language) async {
    await localMemoryService.storeString(
      ILocalMemoryService.languageStoreKey,
      language.name,
    );
  }
}
