import 'package:flutter/material.dart';
import 'package:pomodoro/features/settings/widgets/integers_scroll_picker_widget.dart';
import 'package:pomodoro/theme/sizes.dart';

class TestPage extends StatelessWidget {
  static const String routeName = '/test-page';
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: Sizes.size56,
          child: IntegerScrollPickerWidget(
            options: const [10, 15, 20, 25, 30],
            onPicked: (p0) => print('selected: $p0'),
          ),
        ),
      ),
    );
  }
}
