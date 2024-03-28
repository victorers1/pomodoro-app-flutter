import 'package:flutter/material.dart';
import 'package:pomodoro/enums/timer_mode_enum.dart';
import 'package:pomodoro/features/timer/timer_service.dart';

class HomeController with ChangeNotifier {
  HomeController(this._timerService) {
    _timerService.addCountListener(notifyListeners);
    _timerService.addCountListener(advanceMultiColorTimer);
    _timerService.addTimerCompleteListener(toggleTimerMode);
    _timerService.addTimerCompleteListener(notifyListeners);
  }

  var timerMode = TimerMode.pomodoro;

  final List<int> multiColorBarProgress = [0];

  final TimerService _timerService;

  @override
  void dispose() {
    super.dispose();
    _timerService.dispose();
  }

  String get time => _timerService.formattedTime;

  double get timerProgress => _timerService.progress;

  bool get isTimerCounting => _timerService.isCounting;

  void resumeTimer() {
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

    addStepToMultiColorTimer();
    notifyListeners();
  }

  void advanceMultiColorTimer() {
    multiColorBarProgress.last++;
  }

  void addStepToMultiColorTimer() {
    multiColorBarProgress.add(0);
  }
}
