import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pomodoro/features/build_info/i_build_info_service.dart';
import 'package:pomodoro/features/build_info/package_info_plus_service.dart';
import 'package:pomodoro/features/home/home_controller.dart';
import 'package:pomodoro/features/local_memory/i_local_memory_service.dart';
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
  final buildInfoService = await initializeBuildInfoService();

  runApp(
    PomodoroApp(
      settingsController: settingsController,
      homeController: homeController,
      localMemoryService: localMemoryService,
      buildInfoService: buildInfoService,
    ),
  );
}

Future<IBuildInfoService> initializeBuildInfoService() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final IBuildInfoService buildInfoService = PackageInfoPlusService(
    packageInfoPlus: packageInfo,
  );
  return buildInfoService;
}

HomeController initializeHomeController() {
  final homeController = HomeController(TimerService());
  return homeController;
}

Future<SettingsController> initializeSettingsController(
  ILocalMemoryService localMemoryService,
) async {
  final settingsController = SettingsController(
    SettingsService(localMemoryService: localMemoryService),
  );
  await settingsController.loadSettings();
  return settingsController;
}

Future<ILocalMemoryService> initializeLocalMemoryService() async {
  final prefs = await SharedPreferences.getInstance();
  final ILocalMemoryService localMemoryService = SharedPreferenceService(
    prefs: prefs,
  );
  return localMemoryService;
}
