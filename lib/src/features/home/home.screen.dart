import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:fizzbuzz/src/app/service_locator.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.notACounterAppBarTitle, maxLines: 2)),
      body: Center(
        child: EasyDynamicThemeSwitch(),
      ),
    );
  }
}


