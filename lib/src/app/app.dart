import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fizzbuzz/r.dart';
import 'package:fizzbuzz/src/app/service_locator.dart';
import 'package:fizzbuzz/src/app/services/navigation.dart';

import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return
      MaterialApp(
        themeMode: EasyDynamicTheme.of(context).themeMode,
        theme: R.theme.light,
        darkTheme: R.theme.dark,
        navigatorKey: service<Navigation>().navigatorKey,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routes: AppRoutes().routes,
        initialRoute: '/',
      )



    ;


  }
}
