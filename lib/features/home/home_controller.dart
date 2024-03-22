import 'package:flutter/material.dart';
import 'package:pomodoro/features/timer/timer_service.dart';

class HomeController with ChangeNotifier {
  final TimerService _timerService;

  HomeController(this._timerService) {
    _timerService.addListener(() {
      notifyListeners();
    });
  }

  String get time => _timerService.time;

  double get timerProgress => _timerService.progress;

  bool get isTimerCounting => _timerService.isCounting;

  @override
  void dispose() {
    super.dispose();
    _timerService.dispose();
  }

  void startTimer() {
    _timerService.startCount();
  }

  void resetTimer() {
    _timerService.resetTimer();
    notifyListeners();
  }
}
