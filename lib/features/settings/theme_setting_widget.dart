import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/extensions/string_extensions.dart';

class AppThemeSettingWidget extends StatelessWidget {
  const AppThemeSettingWidget({
    super.key,
    this.themeMode,
    this.onChanged,
  });

  final ThemeMode? themeMode;

  final void Function(ThemeMode?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.theme.capitalize),
      trailing: DropdownButton<ThemeMode>(
        value: themeMode,
        onChanged: onChanged,
        items: [
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(
              AppLocalizations.of(context)!.systemTheme.capitalize,
            ),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(
              AppLocalizations.of(context)!.lightTheme.capitalize,
            ),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(
              AppLocalizations.of(context)!.darkTheme.capitalize,
            ),
          )
        ],
      ),
    );
  }
}
