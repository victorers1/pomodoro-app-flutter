import 'package:flutter/material.dart';
import 'package:pomodoro/features/local_memory/local_memory_service.dart';

class SettingsService {
  final LocalMemoryService localMemoryService;

  SettingsService({required this.localMemoryService});

  Future<ThemeMode> themeMode() async {
    final lastSavedTheme = await localMemoryService.loadString(
      LocalMemoryService.themeModeStoreKey,
    );

    return ThemeMode.values.byName(lastSavedTheme ?? ThemeMode.system.name);
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    localMemoryService.storeString(
      LocalMemoryService.themeModeStoreKey,
      theme.name,
    );
  }
}
