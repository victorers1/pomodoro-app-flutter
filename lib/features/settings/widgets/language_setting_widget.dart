import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/enums/language_enum.dart';
import 'package:pomodoro/extensions/string_extensions.dart';
import 'package:pomodoro/theme/sizes.dart';

class LanguageSettingWidget extends StatelessWidget {
  const LanguageSettingWidget({
    super.key,
    this.language,
    this.onSelected,
  });

  final Language? language;
  final void Function(Language?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: Sizes.size16),
      title: Text(AppLocalizations.of(context)!.language.capitalize),
      trailing: DropdownMenu<Language>(
        initialSelection: language,
        onSelected: onSelected,
        enableFilter: false,
        requestFocusOnTap: false,
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        dropdownMenuEntries: [
          DropdownMenuEntry(
            value: Language.en,
            label: Language.en.label.capitalize,
          ),
          DropdownMenuEntry(
            value: Language.pt,
            label: Language.pt.label.capitalize,
          ),
        ],
      ),
    );
  }
}
