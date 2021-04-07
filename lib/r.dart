import 'package:flutter/material.dart';
import 'gen/assets.gen.dart';

/// Class that holds reference to app configurations and constants.
///
//The naming mimics Android's R class 😉
/// This class should hold only contain instances of other classes which in turn
/// will hold the app constants such as assets, themes, strings(not i18n) etc.
///Every classed contained here is meant to centralize constants and avoid runtime errors
///```
/// Text(R.str.website);
/// ```
class R {
  const R._();

  static $AssetsImagesGen get image => Assets.images;

  static _Themes get theme => const _Themes._();
}

/// Holds the themes used throughout the app
class _Themes {
  const _Themes._();

  ThemeData get light => ThemeData.light().copyWith(primaryColor: Colors.deepPurpleAccent);

  ThemeData get dark => ThemeData.dark().copyWith(primaryColor: Colors.deepPurple);
}
