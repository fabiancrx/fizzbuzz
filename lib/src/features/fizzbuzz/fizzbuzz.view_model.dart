import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercharged/supercharged.dart';
import 'fizzbuzz.dart';

/// Presenter of a number that has been applied the [fizzbuzz] algorithm
@immutable
class FizzbuzzPresenter {
  /// The [fizzbuzzStatus] is calculated by default but a predefined value can be passed via constructor,
  /// as the class in immutable to avoid recalculating
  //(in this case there is no gain as fizzbuzz is O(1) but is a good practice)
  FizzbuzzPresenter(this.value, {this.isFavorite = false, String? fizzbuzzStatus})
      : this.fizzbuzzStatus = fizzbuzzStatus ?? fizzBuzz(value);

  final int value;
  late final String fizzbuzzStatus;
  final bool isFavorite;
  late final itemNumber = 'No: $value';
}

/// An Observable that controls a list of [FizzbuzzPresenter].
class FizzbuzzList extends StateNotifier<List<FizzbuzzPresenter>> {
  FizzbuzzList([List<FizzbuzzPresenter>? initialNumbers]) : super(initialNumbers ?? []);

  void toggle(int value) {
    state = [
      for (final number in state)
        if (number.value == value)
          FizzbuzzPresenter(number.value, isFavorite: !number.isFavorite, fizzbuzzStatus: number.fizzbuzzStatus)
        else
          number,
    ];
  }
}

final fizzbuzzSetProvider = StateNotifierProvider<FizzbuzzList, List<FizzbuzzPresenter>>((ref) {
  late final items = 1.rangeTo(100).map((value) => FizzbuzzPresenter(value)).toList();
  return FizzbuzzList(items);
});
