import 'package:flutter/material.dart';
import 'package:pomodoro/features/home/home_controller.dart';
import 'package:pomodoro/features/timer/timer_service.dart';

import 'features/app.dart';
import 'features/settings/settings_controller.dart';
import 'features/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  final homeController = HomeController(TimerService());

  runApp(
    PomodoroApp(
      settingsController: settingsController,
      homeController: homeController,
    ),
  );
}
