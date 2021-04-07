import 'package:flutter_test/flutter_test.dart';
import 'package:fizzbuzz/src/features/fizzbuzz/fizzbuzz.dart';

import '../../lib/src/app/service_locator.dart';

void main() {
  late int start;
  late int end;

  group('Test the correctness of fizzBuzz', () {
    setUp(() {
      start = 1;
      end = 100;
    });
    test('GIVEN a list of numbers divisible by 3 but not 5 WHEN applied the fizzbuzz function then it returns Fizz', () {

      var multiplesOfThree = start.rangeTo(end).where((e) => e % 3 == 0&& !(e%5==0)).toList();
      for(var it in multiplesOfThree){
        expect(fizzBuzz(it), equals('Fizz'),reason: '$it is not multiple of 3');
      }
    });
    test('GIVEN a list of numbers divisible by 5 but not 3 WHEN applied the fizzbuzz function then it returns Buzz', () {

      var multiplesOfFive= start.rangeTo(end).where((e) => e % 5 == 0&& !(e%3==0)).toList();
      for(var it in multiplesOfFive){
        expect(fizzBuzz(it), equals('Buzz'),reason: '$it is not multiple of 5');
      }
    });
    test('GIVEN a list of numbers divisible by 5 and 3 WHEN applied the fizzbuzz function then it returns FizzBuzz', () {

      var multiplesOfFiveAndThree= start.rangeTo(end).where((e) => e % 5 == 0&& e%3==0).toList();
      for(var it in multiplesOfFiveAndThree){
        expect(fizzBuzz(it), equals('FizzBuzz'),reason: '$it is not multiple of 15');
      }
    });
    test('GIVEN a list of numbers in a range  WHEN applied the fizzbuzz function then it returns FizzBuzz', () {

      var multiplesOfFiveAndThree= start.rangeTo(end).where((e) => e % 5 == 0&& e%3==0).toList();
      for(var it in multiplesOfFiveAndThree){
        expect(fizzBuzz(it), equals('FizzBuzz'),reason: '$it is not multiple of 15');
      }
    });

    test('GIVEN a list of numbers in a range  WHEN applied the fizzbuzz function then it returns FizzBuzz', () {

      var nonMultiplesOfFiveOrThree= start.rangeTo(end).where((e) => e % 5 != 0&& e%3!=0).toList();
      for(var it in nonMultiplesOfFiveOrThree){
        expect(fizzBuzz(it), equals('$it'));
      }
    });

  });
}