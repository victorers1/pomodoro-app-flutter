import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/features/timer/time_entity.dart';

void main() {
  group('TimeEntity: ', () {
    group('Constructor: ', () {
      test('default', () {
        final oneHour = TimeEntity(minutes: 59, seconds: 59);
        final fourMinutesTwoSeconds = TimeEntity(minutes: 2, seconds: 122);
        final threeThousendsSecods = TimeEntity(minutes: 0, seconds: 3000);
        final empty = TimeEntity(minutes: 0, seconds: 0);

        expect(oneHour.minutes, equals(59));
        expect(oneHour.seconds, equals(59));
        expect(fourMinutesTwoSeconds.minutes, equals(4));
        expect(fourMinutesTwoSeconds.seconds, equals(2));
        expect(threeThousendsSecods.minutes, equals(50));
        expect(threeThousendsSecods.seconds, equals(0));
        expect(empty.seconds, equals(0));
        expect(empty.seconds, equals(0));
      });

      test('now', () {
        // arrange
        final now = DateTime.now();

        // act
        final timeNow = TimeEntity.now();

        // assert
        expect(timeNow.minutes, equals(now.minute));
        expect(timeNow.seconds, equals(now.second));
      });

      test('empty', () {
        final timeEmpty = TimeEntity.empty();

        // assert
        expect(timeEmpty.minutes, equals(0));
        expect(timeEmpty.seconds, equals(0));
      });

      test('fromDateTime', () {
        // arrange
        final noon = DateTime(1, 1, 1, 1, 12, 0);
        final nineAndTen = DateTime(1, 1, 1, 1, 9, 10);
        final endOfTheDay = DateTime(1, 1, 1, 1, 59, 59);

        // act
        final noonTime = TimeEntity.fromDateTime(noon);
        final nineAndTenTime = TimeEntity.fromDateTime(nineAndTen);
        final endOfTheDayTime = TimeEntity.fromDateTime(endOfTheDay);

        // assert
        expect(noonTime, equals(TimeEntity(minutes: 12, seconds: 0)));
        expect(nineAndTenTime, equals(TimeEntity(minutes: 9, seconds: 10)));
        expect(endOfTheDayTime, equals(TimeEntity(minutes: 59, seconds: 59)));
      });
    });

    group('difference: ', () {});
  });
}
