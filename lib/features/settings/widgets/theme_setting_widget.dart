import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/extensions/string_extensions.dart';
import 'package:pomodoro/theme/sizes.dart';

class ThemeSettingWidget extends StatelessWidget {
  const ThemeSettingWidget({
    super.key,
    this.themeMode,
    this.onSelected,
  });

  final ThemeMode? themeMode;

  final void Function(ThemeMode?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.theme.capitalize),
      contentPadding: const EdgeInsets.only(left: Sizes.size16),
      trailing: DropdownMenu<ThemeMode>(
        initialSelection: themeMode,
        onSelected: onSelected,
        enableFilter: false,
        requestFocusOnTap: false,
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        dropdownMenuEntries: [
          DropdownMenuEntry(
            value: ThemeMode.system,
            label: AppLocalizations.of(context)!.systemTheme.capitalize,
          ),
          DropdownMenuEntry(
            value: ThemeMode.light,
            label: AppLocalizations.of(context)!.lightTheme.capitalize,
          ),
          DropdownMenuEntry(
            value: ThemeMode.dark,
            label: AppLocalizations.of(context)!.darkTheme.capitalize,
          )
        ],
      ),
    );
  }
}
