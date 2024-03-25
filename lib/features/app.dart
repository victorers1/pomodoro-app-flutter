import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/features/home/home_controller.dart';

import 'home/home_page.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_page.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({
    super.key,
    required this.settingsController,
    required this.homeController,
  });

  final SettingsController settingsController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            return MaterialApp(
              /// Providing a restorationScopeId allows the Navigator built by
              /// the MaterialApp to restore the navigation stack when a user
              /// leaves and returns to the app after it has been killed while
              /// running in the background.
              restorationScopeId: 'app',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,

              /// Use AppLocalizations to configure the correct application
              /// title depending on the user's locale.
              ///
              /// The appTitle is defined in .arb files found in the
              /// localization directory.
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: ThemeData(
                colorScheme: lightDynamic ??
                    ColorScheme.fromSeed(
                      seedColor: Colors.blue,
                    ),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkDynamic ??
                    ColorScheme.fromSeed(
                      seedColor: Colors.black,
                    ),
                useMaterial3: true,
              ),
              themeMode: settingsController.themeMode,

              /// Define a function to handle named routes in order to support
              /// Flutter web url navigation and deep linking.
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case SettingsPage.routeName:
                        return SettingsPage(controller: settingsController);
                      case HomePage.routeName:
                      default:
                        return HomePage(controller: homeController);
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
