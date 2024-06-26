import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/enums/timer_mode_enum.dart';
import 'package:pomodoro/extensions/string_extensions.dart';
import 'package:pomodoro/features/home/home_controller.dart';
import 'package:pomodoro/features/home/settings_icon_widget.dart';
import 'package:pomodoro/features/timer/multicolor_progress_bar_widget.dart';
import 'package:pomodoro/features/timer/timer_progress_indicator_widget.dart';
import 'package:pomodoro/test_page.dart';
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
    final homePageWidth = MediaQuery.of(context).size.width / 1.5;

    final nextTimerMode = controller.timerMode == TimerMode.pomodoro
        ? AppLocalizations.of(context)!.breakTimer
        : AppLocalizations.of(context)!.appTitle;

    final nextTimerButtonLabel = AppLocalizations.of(context)!.forwardTimer(
      nextTimerMode,
    );

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onHorizontalDragEnd: (details) =>
                  Navigator.of(context).pushNamed(TestPage.routeName),
              child: Text(AppLocalizations.of(context)!.home.capitalize),
            ),
            centerTitle: true,
            actions: const [SettingsIconWidget()],
          ),
          body: Padding(
            padding: const EdgeInsets.all(Sizes.size16),
            child: Center(
              child: SizedBox(
                width: homePageWidth,
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size32,
                        ),
                        child: MulticolorProgressBarWidget(
                          progresses: controller.multiColorBarProgress,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        controller.isTimerCounting
                            ? FloatingActionButton(
                                heroTag: null,
                                tooltip:
                                    AppLocalizations.of(context)!.pauseTimer,
                                onPressed: controller.resumeTimer,
                                child: const Icon(Icons.pause_rounded),
                              )
                            : FloatingActionButton(
                                heroTag: null,
                                tooltip:
                                    AppLocalizations.of(context)!.startTimer,
                                onPressed: controller.resumeTimer,
                                child: const Icon(Icons.play_arrow_rounded),
                              ),
                        const SizedBox(width: Sizes.size24),
                        FloatingActionButton(
                          heroTag: null,
                          tooltip: nextTimerButtonLabel,
                          onPressed: controller.toggleTimerMode,
                          child: const Icon(Icons.fast_forward_rounded),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
