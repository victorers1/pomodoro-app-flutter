import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/extensions/int_extension.dart';

void main() {
  group('leftPad extension:', () {
    test('positive values', () {
      // arrange
      int greaterThen10 = 99;
      int ten = 10;
      int lesserThen10 = 9;

      // act
      String greaterThen10Result = greaterThen10.padLeft;
      String tenResult = ten.padLeft;
      String lesserThen10Result = lesserThen10.padLeft;

      // assert
      expect(greaterThen10Result, equals('99'));
      expect(tenResult, equals('10'));
      expect(lesserThen10Result, equals('09'));
    });

    test('passing zero', () {
      // arrange
      int positiveZero = 0;
      int negativeZero = -0;

      // act
      String positiveZeroResult = positiveZero.padLeft;
      String negativeZeroResult = negativeZero.padLeft;

      // assert
      expect(positiveZeroResult, equals('00'));
      expect(negativeZeroResult, equals('00'));
    });

    test('negative values', () {
      // arrange
      int greaterThen10 = -99;
      int negative10 = -10;
      int lesserThen10 = -9;

      // act
      String greaterThen10Result = greaterThen10.padLeft;
      String negative10Result = negative10.padLeft;
      String lesserThen10Result = lesserThen10.padLeft;

      // assert
      expect(greaterThen10Result, equals('-99'));
      expect(negative10Result, equals('-10'));
      expect(lesserThen10Result, equals('-09'));
    });
  });
}
