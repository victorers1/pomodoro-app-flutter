import 'package:flutter/material.dart';
import 'package:pomodoro/enums/timer_mode_enum.dart';
import 'package:pomodoro/features/timer/timer_service.dart';

class HomeController with ChangeNotifier {
  HomeController(this._timerService) {
    _timerService.addCountListener(notifyListeners);
    _timerService.addTimerCompleteListener(toggleTimerMode);
    _timerService.addTimerCompleteListener(notifyListeners);
  }

  var timerMode = TimerMode.pomodoro;

  final TimerService _timerService;

  @override
  void dispose() {
    super.dispose();
    _timerService.dispose();
  }

  String get time => _timerService.formattedTime;

  double get timerProgress => _timerService.progress;

  bool get isTimerCounting => _timerService.isCounting;

  void onPressedPlayButton() {
    if (timerProgress == 1) {
      _timerService.startTimer();
    } else {
      _timerService.isCounting
          ? _timerService.pauseCount()
          : _timerService.setDecrementingTimer();
    }

    notifyListeners();
  }

  void stopTimer() {
    _timerService.resetTimeCounter();
    notifyListeners();
  }

  void toggleTimerMode() {
    timerMode = (timerMode == TimerMode.pomodoro)
        ? TimerMode.shortBreak
        : TimerMode.pomodoro;
    notifyListeners();
  }
}
