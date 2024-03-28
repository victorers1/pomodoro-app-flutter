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
    final timerColor = Theme.of(context).colorScheme.primary;
    final breakColor = Theme.of(context).colorScheme.inversePrimary;

    return Column(
      children: [
        SizedBox(
          height: Sizes.size8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size8),
            child: Row(
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
