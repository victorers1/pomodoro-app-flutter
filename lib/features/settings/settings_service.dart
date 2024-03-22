import 'package:flutter/material.dart';

class SettingsService {
  // TODO: recover the last theme selected
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// TODO: persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
