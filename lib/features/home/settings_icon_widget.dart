import 'package:flutter/material.dart';
import 'package:pomodoro/features/settings/settings_page.dart';

class SettingsIconWidget extends StatelessWidget {
  const SettingsIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      // TODO: add intl
      tooltip: '',
      onPressed: () {
        Navigator.restorablePushNamed(
          context,
          SettingsPage.routeName,
        );
      },
    );
  }
}
