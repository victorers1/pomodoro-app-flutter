import 'package:flutter/material.dart';
import 'package:pomodoro/theme/sizes.dart';

class TimerProgressIndicatorWidget extends StatelessWidget {
  const TimerProgressIndicatorWidget({
    super.key,
    required this.time,
    required this.progressValue,
  });

  final String time;

  final double progressValue;

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
            child: Text(
              time,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
