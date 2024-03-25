import 'package:flutter/material.dart';
import 'package:pomodoro/enums/timer_mode_enum.dart';
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
    final halfScreenWidth = MediaQuery.of(context).size.width / 2;
    final progressIndicatorSize = Size.square(halfScreenWidth);

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
            color: Theme.of(context).colorScheme.primary,
            strokeWidth: Sizes.size8,
            strokeAlign: BorderSide.strokeAlignInside,
            //TODO: semanticsLabel: ,
            semanticsValue: '$progressValue',
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timerMode.label,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: Sizes.size24,
                  child: TextButton(
                    onPressed: onStopPressed,
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.zero,
                      ),
                    ),
                    child: Text(
                      'STOP',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
