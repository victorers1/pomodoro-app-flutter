import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/features/settings/settings_page.dart';

class SettingsIconWidget extends StatelessWidget {
  const SettingsIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      tooltip: AppLocalizations.of(context)!.goToSettings,
      onPressed: () {
        Navigator.restorablePushNamed(
          context,
          SettingsPage.routeName,
        );
      },
    );
  }
}
