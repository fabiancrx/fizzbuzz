import 'package:fizzbuzz/src/features/fizzbuzz/fizzbuzz.view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FizzBuzz Presenter', () {
    test(
        "Given a FizzbuzzPresenter When  fizzbuzzStatus is not passed to the constructor Then it is calculated to the object's constructor",
        () {
      var mockFizzbizzPresenter = FizzbuzzPresenter(7);
      expect(mockFizzbizzPresenter.isFavorite, false);
      expect(mockFizzbizzPresenter.fizzbuzzStatus, '7');
    });

    test(
        "Given a FizzbuzzPresenter When  fizzbuzzStatus is  passed to the constructor Then it is  assigned to the object",
        () {
      var mockFizzbizzPresenter = FizzbuzzPresenter(7, fizzbuzzStatus: '42', isFavorite: true);
      expect(mockFizzbizzPresenter.isFavorite, true);
      expect(mockFizzbizzPresenter.fizzbuzzStatus, '42');
    });
  });
  group('FizzBuzz View Model', () {
    test('Given a FizzbuzzList When a specific FizzBuzzPresenter is toggled Then it state is changed to favorite', () {
      var mockFizzBuzzList = FizzbuzzList([FizzbuzzPresenter(42)]);
      expect(mockFizzBuzzList.state.first.isFavorite, false);
      mockFizzBuzzList.toggle(42);
      expect(mockFizzBuzzList.state.first.isFavorite, true);
    });
  });
}
