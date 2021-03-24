import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:fizzbuzz/src/features/fizzbuzz/fizzbuzz.screen.dart';
import 'package:flutter/material.dart';
import 'package:fizzbuzz/src/app/service_locator.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FizzBuzz', maxLines: 2),
        leading: EasyDynamicThemeBtn(),
      ),
      body: FizzBuzzPage(start: 1, end: 100),
    );
  }
}
