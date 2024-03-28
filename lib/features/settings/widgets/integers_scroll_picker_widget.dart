import 'package:flutter/material.dart';
import 'package:pomodoro/theme/sizes.dart';

class IntegerScrollPickerWidget extends StatelessWidget {
  const IntegerScrollPickerWidget({
    super.key,
    required this.options,
    required this.onPicked,
  });

  final List<int> options;

  final void Function(int) onPicked;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: options.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(width: Sizes.size8),
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1,
          key: Key('IntegerScrollPickerWidget_$index'),
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () => onPicked(options[index]),
              child: Center(
                child: Text(
                  options[index].toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
