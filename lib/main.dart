import 'package:flutter/material.dart';
import 'package:pomodoro/features/home/home_controller.dart';
import 'package:pomodoro/features/local_memory/local_memory_service.dart';
import 'package:pomodoro/features/local_memory/shared_preference_service.dart';
import 'package:pomodoro/features/timer/timer_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/app.dart';
import 'features/settings/settings_controller.dart';
import 'features/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localMemoryService = await initializeLocalMemoryService();
  final homeController = initializeHomeController();
  final settingsController = await initializeSettingsController(
    localMemoryService,
  );

  runApp(
    PomodoroApp(
      settingsController: settingsController,
      homeController: homeController,
      localMemoryService: localMemoryService,
    ),
  );
}

HomeController initializeHomeController() {
  final homeController = HomeController(TimerService());
  return homeController;
}

Future<SettingsController> initializeSettingsController(
  LocalMemoryService localMemoryService,
) async {
  final settingsController = SettingsController(
    SettingsService(localMemoryService: localMemoryService),
  );
  await settingsController.loadSettings();
  return settingsController;
}

Future<LocalMemoryService> initializeLocalMemoryService() async {
  final prefs = await SharedPreferences.getInstance();
  final LocalMemoryService localMemoryService = SharedPreferenceService(
    prefs: prefs,
  );
  return localMemoryService;
}
