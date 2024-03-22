import 'package:pomodoro/extensions/int_extension.dart';

class TimeEntity {
  TimeEntity({
    required int minutes,
    required int seconds,
  }) {
    if (seconds > 59) {
      int minutesToAdd = seconds ~/ 60;
      seconds -= minutesToAdd * 60;

      this.seconds = seconds;
      this.minutes = minutes + minutesToAdd;
    } else {
      this.minutes = minutes;
      this.seconds = seconds;
    }

    if (minutes > 59) {
      throw Exception(
        'Value $minutes passed to attribute \'minutes\', but it cannot exceed 59',
      );
    }
  }

  factory TimeEntity.empty() => TimeEntity(minutes: 0, seconds: 0);

  factory TimeEntity.fromDateTime(DateTime dateTime) => TimeEntity(
        minutes: dateTime.minute,
        seconds: dateTime.second,
      );

  factory TimeEntity.now() => TimeEntity.fromDateTime(DateTime.now());

  late final int minutes;
  late final int seconds;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimeEntity &&
        other.seconds == seconds &&
        other.minutes == minutes;
  }

  @override
  int get hashCode => seconds.hashCode ^ minutes.hashCode;

  @override
  String toString() => '${minutes.padLeft}:${seconds.padLeft}';

  TimeEntity difference(TimeEntity other) {
    final differenceInSeconds = inSeconds - other.inSeconds;
    return TimeEntity(minutes: 0, seconds: differenceInSeconds);
  }

  bool get isEmpty => minutes == 0 && seconds == 0;

  int get inSeconds => seconds + minutes * 60;

  TimeEntity copyWith({int? minutes, int? seconds}) {
    return TimeEntity(
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
    );
  }
}
