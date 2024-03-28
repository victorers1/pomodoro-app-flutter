import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pomodoro/enums/timer_mode_enum.dart';
import 'package:pomodoro/extensions/string_extensions.dart';
import 'package:pomodoro/features/timer/timer_clock_widget.dart';
import 'package:pomodoro/theme/sizes.dart';

class TimerProgressIndicatorWidget extends StatelessWidget {
  const TimerProgressIndicatorWidget({
    super.key,
    required this.time,
    required this.progressValue,
    required this.onStopPressed,
    this.timerMode = TimerMode.pomodoro,
  });

  final String time;

  final double progressValue;

  final VoidCallback onStopPressed;

  final TimerMode timerMode;

  @override
  Widget build(BuildContext context) {
    final halfScreenWidth = MediaQuery.of(context).size.width / 1.5;
    final progressIndicatorSize = Size.square(halfScreenWidth);
    final timeHeaderLabel = timerMode == TimerMode.shortBreak
        ? AppLocalizations.of(context)!.breakTimer.capitalize
        : AppLocalizations.of(context)!.appTitle.capitalize;

    final pomodoroColor = Theme.of(context).colorScheme.primary;
    final breakColor = Theme.of(context).colorScheme.inversePrimary;

    return Container(
      constraints: BoxConstraints.tight(progressIndicatorSize),
      width: halfScreenWidth,
      height: halfScreenWidth,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: progressValue,
            strokeCap: StrokeCap.round,
            backgroundColor: Theme.of(context).highlightColor,
            color: timerMode == TimerMode.pomodoro ? pomodoroColor : breakColor,
            strokeWidth: Sizes.size8,
            strokeAlign: BorderSide.strokeAlignInside,
            semanticsLabel:
                AppLocalizations.of(context)!.timerIndicatorSemanticsLabel,
            semanticsValue: '$progressValue',
          ),
          TimerClockWidget(
            timeHeaderLabel: timeHeaderLabel,
            time: time,
            onStopPressed: onStopPressed,
          )
        ],
      ),
    );
  }
}
