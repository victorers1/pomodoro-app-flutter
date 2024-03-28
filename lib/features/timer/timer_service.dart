import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pomodoro/features/timer/time_entity.dart';

class TimerService {
  double _remainingSeconds = double.infinity;
  double _totalSeconds = double.infinity;

  /// Functions called when the counter advances one time unit. The first call
  /// is at after the first second.
  final List<VoidCallback> _countListeners = [];
  Timer? _timer;

  /// Functions called when the timer reaches zero seconds
  final List<VoidCallback> _timerCompleteListeners = [];

  bool get isCounting => _timer?.isActive ?? false;

  String get formattedTime => TimeEntity(
        minutes: 0,
        seconds: _remainingSeconds == double.infinity
            ? 0
            : _remainingSeconds.toInt(),
      ).toString();

  /// [progress] is a number in the interval [0,1].
  /// When the calculation has an error (division by zero or is NaN), [progress]
  /// is 1
  double get progress {
    var result = double.infinity;
    try {
      result = (_totalSeconds - _remainingSeconds) / _totalSeconds;
    } on UnsupportedError {
      result = 1;
    }
    return result.isNaN ? 1 : result;
  }

  void dispose() {
    resetTimeCounter();
    clearListeners();
  }

  void startTimer() {
    _totalSeconds = _remainingSeconds = const Duration(
      seconds: 5,
    ).inSeconds.toDouble();

    setDecrementingTimer();
  }

  void pauseCount() {
    _timer?.cancel();
  }

  void setDecrementingTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _remainingSeconds--;
      _notifyCountListeners();

      if (_countFinished) {
        resetTimeCounter();
        _notifyTimerCompleteListeners();
      }
    });
  }

  void resetTimeCounter() {
    _timer?.cancel();
    _timer = null;
    _remainingSeconds = double.infinity;
    _totalSeconds = double.infinity;
  }

  void addCountListener(VoidCallback f) {
    _countListeners.add(f);
  }

  void addTimerCompleteListener(VoidCallback f) {
    _timerCompleteListeners.add(f);
  }

  void clearListeners() {
    _countListeners.clear();
    _timerCompleteListeners.clear();
  }

  bool get _countFinished => _remainingSeconds == 0;

  void _notifyCountListeners() {
    for (final l in _countListeners) {
      l.call();
    }
  }

  void _notifyTimerCompleteListeners() {
    for (final l in _timerCompleteListeners) {
      l.call();
    }
  }
}
