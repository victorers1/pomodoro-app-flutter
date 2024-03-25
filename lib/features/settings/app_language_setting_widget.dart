import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/enums/language_enum.dart';
import 'package:pomodoro/extensions/string_extensions.dart';

class AppLanguageSettingWidget extends StatelessWidget {
  const AppLanguageSettingWidget({
    super.key,
    this.language,
    this.onChanged,
  });

  final Language? language;
  final void Function(Language?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.language.capitalize),
      trailing: DropdownButton<Language>(
        value: language,
        onChanged: onChanged,
        items: [
          DropdownMenuItem(
            value: Language.en,
            child: Text(Language.en.label.capitalize),
          ),
          DropdownMenuItem(
            value: Language.pt,
            child: Text(Language.pt.label.capitalize),
          ),
        ],
      ),
    );
  }
}
