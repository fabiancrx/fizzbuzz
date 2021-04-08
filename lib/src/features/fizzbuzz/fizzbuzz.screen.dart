import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fizzbuzz.view_model.dart';

class FizzBuzzPage extends HookWidget {
  const FizzBuzzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fizzbuzzes = useProvider(fizzbuzzSetProvider);
    return ListView.builder(
        itemCount: fizzbuzzes.length,
        itemBuilder: (ctx, i) {
          return ProviderScope(
            overrides: [_currentFizzbuzz.overrideWithValue(fizzbuzzes[i])],
            child: const FizzBuzzItemTile(),
          );
        });
  }
}

class FizzBuzzItemTile extends HookWidget {
  const FizzBuzzItemTile();

  @override
  Widget build(BuildContext context) {
    final FizzbuzzPresenter fizzbuzz = useProvider(_currentFizzbuzz);
    final starIcon = fizzbuzz.isFavorite ? Icons.star : Icons.star_border;

    return ListTile(
      leading: AutoSizeText(fizzbuzz.itemNumber, key: Key(fizzbuzz.itemNumber)),
      title: Center(child: Text(fizzbuzz.fizzbuzzStatus)),
      onTap: () => context.read(fizzbuzzSetProvider.notifier).toggle(fizzbuzz.value),
      trailing: Icon(starIcon),
    );
  }
}

/// By retrieving the [FizzBuzzItem] through a provider instead of through its
/// constructor, this allows [FizzBuzzItemTile] to be instantiated using the `const` keyword.
/// and avoid widget rebuilds
final _currentFizzbuzz = ScopedProvider<FizzbuzzPresenter>(null);
