import 'package:auto_size_text/auto_size_text.dart';
import 'package:fizzbuzz/src/app/service_locator.dart';
import 'package:fizzbuzz/src/features/fizzbuzz/fizzbuzz.dart';
import 'package:flutter/material.dart';

class FizzBuzzPage extends StatelessWidget {
  late final List<String> _fizzBuzzes = 1.rangeTo(100).map(fizzBuzz).toList();

  FizzBuzzPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        final itemNumber = 'No: ${i + 1}';
        return ListTile(
            leading: AutoSizeText(itemNumber, key: Key(itemNumber)), title: Center(child: Text(_fizzBuzzes[i])));
      },
      itemCount: _fizzBuzzes.length,
    );
  }
}
