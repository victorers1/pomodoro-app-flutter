import 'package:flutter/material.dart';
import 'package:pomodoro/features/home/home_controller.dart';
import 'package:pomodoro/features/settings/settings_page.dart';
import 'package:pomodoro/features/timer/timer_progress_indicator_widget.dart';
import 'package:pomodoro/theme/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.restorablePushNamed(
                      context, SettingsPage.routeName);
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(Sizes.size16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  child: TimerProgressIndicatorWidget(
                    time: controller.time,
                    progressValue: controller.timerProgress,
                  ),
                ),
                const SizedBox(height: Sizes.size16),
                Align(
                  child: controller.isTimerCounting
                      ? FloatingActionButton(
                          onPressed: controller.resetTimer,
                          child: const Icon(
                            Icons.stop_rounded,
                          ),
                        )
                      : FloatingActionButton(
                          onPressed: controller.startTimer,
                          child: const Icon(
                            Icons.play_arrow_rounded,
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
