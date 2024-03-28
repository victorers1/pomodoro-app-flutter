import 'package:flutter/material.dart';
import 'package:pomodoro/theme/sizes.dart';

class MulticolorProgressBarWidget extends StatelessWidget {
  const MulticolorProgressBarWidget({
    super.key,
    required this.progresses,
  });

  final List<int> progresses;

  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context).colorScheme.onSurface;
    final timerColor = Theme.of(context).colorScheme.primary;
    final breakColor = Theme.of(context).colorScheme.inversePrimary;
    final progressDidNotStart = progresses.length == 1 && progresses.first == 0;

    return Column(
      children: [
        SizedBox(
          height: Sizes.size8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size8),
            child: progressDidNotStart
                ? Container(color: defaultColor)
                : Row(
                    children: List.generate(
                      progresses.length,
                      (index) => Flexible(
                        flex: progresses[index],
                        child: Container(
                          color: index % 2 == 0 ? timerColor : breakColor,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        Text(progresses.toString()),
      ],
    );
  }
}
