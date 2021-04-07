import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:fizzbuzz/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fizzbuzz/r.dart';
import 'package:fizzbuzz/src/app/services/navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes/routes.dart';

final navigation = Provider((_) => Navigation());

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return MaterialApp(
      themeMode: EasyDynamicTheme.of(context).themeMode,
      theme: R.theme.light,
      darkTheme: R.theme.dark,
      navigatorKey: watch(navigation).navigatorKey,
      localizationsDelegates: [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate],
      supportedLocales: AppLocalizations.supportedLocales,
      routes: AppRoutes().routes,
      initialRoute: '/',
    );
  }
}
