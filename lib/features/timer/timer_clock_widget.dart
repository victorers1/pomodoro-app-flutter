import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/extensions/string_extensions.dart';

class TimerClockWidget extends StatelessWidget {
  const TimerClockWidget({
    super.key,
    required this.timeHeaderLabel,
    required this.time,
    required this.onStopPressed,
  });

  final String timeHeaderLabel;
  final String time;
  final VoidCallback onStopPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeHeaderLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            child: TextButton(
              onPressed: onStopPressed,
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
              child: Text(
                AppLocalizations.of(context)!.stopTimer.capitalize,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
