import 'package:flutter/material.dart';
import 'package:pomodoro/enums/language_enum.dart';
import 'package:pomodoro/features/local_memory/i_local_memory_service.dart';
import 'package:pomodoro/features/timer/timer_service.dart';

class SettingsService {
  final ILocalMemoryService localMemoryService;

  SettingsService({required this.localMemoryService});

  Future<Duration> loadFocusDuration() async {
    final lastSavedFocusDuration = await localMemoryService.loadInt(
      ILocalMemoryService.focusDurationStoreKey,
    );
    return Duration(
      minutes:
          lastSavedFocusDuration ?? TimerService.focusDefaultDuration.inMinutes,
    );
  }

  Future<void> updateFocusDuration(Duration focusDuration) =>
      localMemoryService.storeInt(
        ILocalMemoryService.focusDurationStoreKey,
        focusDuration.inMinutes,
      );

  Future<Duration> loadBreakDuration() async {
    final lastSavedBreakDuration = await localMemoryService.loadInt(
      ILocalMemoryService.breakDurationStoreKey,
    );
    return Duration(
      minutes:
          lastSavedBreakDuration ?? TimerService.breakDefaultDuration.inMinutes,
    );
  }

  Future<void> updateBreakDuration(Duration breakDuration) =>
      localMemoryService.storeInt(
        ILocalMemoryService.breakDurationStoreKey,
        breakDuration.inMinutes,
      );

  Future<ThemeMode> loadThemeMode() async {
    final lastSavedTheme = await localMemoryService.loadString(
      ILocalMemoryService.themeModeStoreKey,
    );
    return ThemeMode.values.byName(lastSavedTheme ?? ThemeMode.system.name);
  }

  Future<void> updateThemeMode(ThemeMode theme) =>
      localMemoryService.storeString(
        ILocalMemoryService.themeModeStoreKey,
        theme.name,
      );

  Future<Language> loadLanguage() async {
    final lastSavedLanguage = await localMemoryService.loadString(
      ILocalMemoryService.languageStoreKey,
    );
    return Language.values.byName(lastSavedLanguage ?? Language.en.name);
  }

  Future<void> updateLanguage(Language language) =>
      localMemoryService.storeString(
        ILocalMemoryService.languageStoreKey,
        language.name,
      );
}
