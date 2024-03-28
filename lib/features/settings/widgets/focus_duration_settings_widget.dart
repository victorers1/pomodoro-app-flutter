import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/extensions/string_extensions.dart';

// TODO: add intl
class FocusDurationSettingWidget extends StatelessWidget {
  const FocusDurationSettingWidget({
    super.key,
    this.onChanged,
    required this.focusDuration,
  });

  final Duration focusDuration;

  final void Function(int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Focus duration'.capitalize),
      trailing: Text(
        '${focusDuration.inMinutes} min',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
