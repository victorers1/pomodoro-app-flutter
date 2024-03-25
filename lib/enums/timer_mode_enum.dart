enum TimerMode {
  pomodoro('Pomodoro'),
  shortBreak('Break');

  const TimerMode(
    this.label,
  );

  final String label;
}
