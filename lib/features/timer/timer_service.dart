import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pomodoro/features/timer/time_entity.dart';

class TimerService {
  DateTime? finalTime;
  DateTime? initialTime;
  final List<VoidCallback> _listeners = [];
  Timer? _timer;

  DateTime get now => DateTime.now();

  bool get isCounting => _timer?.isActive ?? false;

  String get time => TimeEntity(
        minutes: 0,
        seconds: finalTime?.difference(now).inSeconds ?? 0,
      ).toString();

  bool get countFinished => finalTime?.isBefore(now) ?? true;

  int get _finalTimeInMilliseconds => (finalTime?.millisecondsSinceEpoch ?? 0);

  int get _initialTimeInMilliseconds =>
      (initialTime?.millisecondsSinceEpoch ?? 0);

  int get _nowInMilliseconds => now.millisecondsSinceEpoch;

  /// Linear convertion from [initialTime, finalTime] to [0, 1]
  double get progress {
    try {
      final currentRange = (_nowInMilliseconds - _initialTimeInMilliseconds);
      final oldRange = (_finalTimeInMilliseconds - _initialTimeInMilliseconds);
      final progress = (currentRange / oldRange).clamp(0, 1);
      return progress.toDouble();
    } on UnsupportedError {
      return 0;
    }
  }

  void dispose() {
    resetTimer();
    clearListeners();
  }

  void startCount() {
    initialTime = now;
    finalTime = now.add(const Duration(minutes: 25));

    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      notifyListeners();

      if (countFinished) {
        resetTimer();
      }
    });
  }

  void pauseCount() {
    _timer?.cancel();
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    finalTime = null;
    initialTime = null;
  }

  void addListener(VoidCallback f) {
    _listeners.add(f);
  }

  void clearListeners() {
    _listeners.clear();
  }

  void notifyListeners() {
    for (final l in _listeners) {
      l.call();
    }
  }
}
