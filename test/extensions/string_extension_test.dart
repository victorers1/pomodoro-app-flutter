import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/extensions/string_extensions.dart';

void main() {
  group('String extension: ', () {
    group('capitalize: ', () {
      test('words', () {
        // arrange
        const word = 'word';
        const abacaxi = 'Abacaxi';
        const carro = 'CARRO';

        //act
        final capitalizedWord = word.capitalize;
        final capitalizedAbacaxi = abacaxi.capitalize;
        final capitalizedCarro = carro.capitalize;

        //assert
        expect(capitalizedWord, equals('Word'));
        expect(capitalizedAbacaxi, equals('Abacaxi'));
        expect(capitalizedCarro, equals('Carro'));
      });

      test('symbols', () {
        // arrange
        const word = 'w0rd4';
        const symbols = '!@#\$%^&*()';
        const carro = 'C\'4R\'R0';

        //act
        final capitalizedWord = word.capitalize;
        final capitalizedSymbols = symbols.capitalize;
        final capitalizedCarro = carro.capitalize;

        //assert
        expect(capitalizedWord, equals('W0rd4'));
        expect(capitalizedSymbols, equals('!@#\$%^&*()'));
        expect(capitalizedCarro, equals('C\'4r\'r0'));
      });
    });

    group('capitalizeEachWord: ', () {
      test('words', () {
        // arrange
        const word = 'word powerpoint excel';
        const abacaxi = 'Abacaxi Maçã Pêra';
        const carro = 'CARRO MOTO JUMENTO';

        //act
        final capitalizedWord = word.capitalizeEachWord;
        final capitalizedAbacaxi = abacaxi.capitalizeEachWord;
        final capitalizedCarro = carro.capitalizeEachWord;

        //assert
        expect(capitalizedWord, equals('Word Powerpoint Excel'));
        expect(capitalizedAbacaxi, equals('Abacaxi Maçã Pêra'));
        expect(capitalizedCarro, equals('Carro Moto Jumento'));
      });

      test('symbols', () {
        // arrange
        const word = 'w0rd p0w3rpo1nt 3xc31';
        const abacaxi = '!@# %^&* ()_+';
        const carro = 'C4RR0 \' M0T0 \' JUM3NT0';

        //act
        final capitalizedWord = word.capitalizeEachWord;
        final capitalizedAbacaxi = abacaxi.capitalizeEachWord;
        final capitalizedCarro = carro.capitalizeEachWord;

        //assert
        expect(capitalizedWord, equals('W0rd P0w3rpo1nt 3xc31'));
        expect(capitalizedAbacaxi, equals('!@# %^&* ()_+'));
        expect(capitalizedCarro, equals('C4rr0 \' M0t0 \' Jum3nt0'));
      });
    });
  });
}
