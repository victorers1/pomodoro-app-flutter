import 'package:flutter/material.dart';
import 'package:pomodoro/features/home/home_controller.dart';
import 'package:pomodoro/features/home/settings_icon_widget.dart';
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
            actions: const [SettingsIconWidget()],
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
                    onStopPressed: controller.stopTimer,
                    timerMode: controller.timerMode,
                  ),
                ),
                const SizedBox(height: Sizes.size16),
                Row(
                  children: [
                    const Spacer(),
                    controller.isTimerCounting
                        ? FloatingActionButton(
                            heroTag: null,
                            tooltip: 'Pause',
                            onPressed: controller.onPressedPlayButton,
                            child: const Icon(
                              Icons.pause_rounded,
                            ),
                          )
                        : FloatingActionButton(
                            heroTag: null,
                            tooltip: 'Start',
                            onPressed: controller.onPressedPlayButton,
                            child: const Icon(
                              Icons.play_arrow_rounded,
                            ),
                          ),
                    const SizedBox(width: Sizes.size24),
                    FloatingActionButton(
                      heroTag: null,
                      tooltip: controller.nextTimerButtonLabel,
                      onPressed: controller.toggleTimerMode,
                      child: const Icon(
                        Icons.fast_forward_rounded,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
