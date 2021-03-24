/// FizzBuzz algorithm depending on the number divisibility it returns:
/// 'FizzBuzz' if the number is divisible by 3 and 5
/// 'Fizz' if the number is divisible only by 3
/// 'Buzz' if the number is divisible only by 5
/// A string containing the number if the number is not divisible by 3 or 5
String fizzBuzz(int number) {
  late var byFive = number % 5 == 0;
  late var byThree = number % 3 == 0;
  if (byFive && byThree) {
    return 'FizzBuzz';
  } else if (byThree) {
    return 'Fizz';
  } else if (byFive) {
    return 'Buzz';
  } else {
    return '$number';
  }
}
