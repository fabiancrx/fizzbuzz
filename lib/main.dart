import 'dart:async';
import 'dart:developer';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/app.dart';
import 'src/app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject services [ inject.dart ]
  await inject();
  // Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Use dart zone to log errors that occur outside runApp(replace with Crashlytics if you want)
  runZonedGuarded(
    () => runApp(const Dependencies( App())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

/// Widget that injects the different dependencies needed for inheritedWidgets or other packages to work
/// It is a widget and not a function so it can be const and avoid rebuild
class Dependencies extends StatelessWidget {
  final Widget wrapped;

  const Dependencies(this.wrapped, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RootRestorationScope(
      restorationId: 'root',
      child: EasyDynamicThemeWidget(child: wrapped),
    );
  }
}
