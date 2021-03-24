import 'package:auto_size_text/auto_size_text.dart';
import 'package:fizzbuzz/src/app/service_locator.dart';
import 'package:fizzbuzz/src/features/fizzbuzz/fizzbuzz.dart';
import 'package:flutter/material.dart';

class FizzBuzzPage extends StatelessWidget {
  final int start;
  final int end;
  late final List<String> _fizzBuzzes = 1.rangeTo(100).map(fizzBuzz).toList();

  FizzBuzzPage({Key? key, required this.start, required this.end}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, i) {
      return ListTile(leading: AutoSizeText('No: ${i+1}'), title: Center(child: AutoSizeText(_fizzBuzzes[i])));
    },itemCount: _fizzBuzzes.length,);
  }
}
