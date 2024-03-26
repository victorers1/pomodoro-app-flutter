import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/extensions/string_extensions.dart';
import 'package:pomodoro/features/build_info/i_build_info_service.dart';
import 'package:pomodoro/features/build_info/version_info_widget.dart';
import 'package:pomodoro/features/settings/language_setting_widget.dart';
import 'package:pomodoro/features/settings/theme_setting_widget.dart';
import 'package:pomodoro/theme/sizes.dart';

import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.controller,
    required this.buildInfoService,
  });

  static const routeName = '/settings';

  final SettingsController controller;
  final IBuildInfoService buildInfoService;

  @override
  Widget build(BuildContext context) {
    final Future<List<String>> buildInfo = Future.wait(
      [buildInfoService.getVersionNumber(), buildInfoService.getBuildNumber()],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.settings.capitalize),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          children: [
            AppThemeSettingWidget(
              themeMode: controller.themeMode,
              onChanged: controller.updateThemeMode,
            ),
            AppLanguageSettingWidget(
              language: controller.language,
              onChanged: controller.updateLanguage,
            ),
            const Spacer(),
            VersionInfoWidget(buildInfo: buildInfo),
          ],
        ),
      ),
    );
  }
}
