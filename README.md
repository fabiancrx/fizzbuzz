# template

A Flutter template for new projects with most of the basic needs covered. This is a very opinionated and personal setup so keep that in mind when filing issues.




# ⚠ The readme is currently outdated ⚠
 Until this template stabilizes please refer to the code as the only source of truth.


## Getting Started

### Architectural Overview
- The architecture closely resembles the one shown [here](https://www.raywenderlich.com/6373413-state-management-with-provider)
- State Management management is handled as follows
    - `/providers` folder will contain most of the logic of the app. 
        - The `*_provider` classes are just services which handle internal state of the application (aka viewModels if you're familiar with the terminology). They should handle all the data processing needs of your app including for the UI **(Please don't mix business logic with UI code even if it's easier that way )**. 
    - The `/services` classes are just plain dart classes which only provide functions and do not keep internal state or modify application state.
- Service location:
    - Get it is used for service Location.
    - Classes  which qualify are the ones which implement business logic, connect to repositories (local or else ), etc. Typically `/api` ,`/providers`, `/services`.
      Services **MUST** only be explicitly initialized in `services.dart` this convention aims to keep all the service's code centralized  and since they are not compile time checked have a single-file/source of truth comes in handy when debugging.
- UI is separated in different folders:
    - `screens` which encapsulate complete views of the app and sub-screens if the information they display is complex enough.
    - `widgets` which contains reusable pieces of the UI.**(If you find yourself copy-pasting a specific widget more than 2 times is probably a good candidate to standardize its parameters and move it to the widgets directory)**
- API folder contains the base contract of the API to which the app communicates (may be more than one but for each a new contract must be made) and its concrete implementations. A contract is created to decouple the implementation from the class and for them to be swappable .
    - Example: Instead of injecting the `concreteApi` you inject the `apiContract` which permits you the developer to swap the implementation to any class which complies with the `apiContract` such as a mock class.
- Core folder holds classes you use throughout your entire app or common logic. In this case the failure class is implemented which encapsulates Exceptions in the network layer. 
- Models folder contain your data classes(plain dart objects) and usually the logic to serialize , deserialize them if needed.
   - Fixtures keep raw data typically in `MdelName.json` format from which the models must be de serialized from. they provide enhanced testability and can be used to mock a server response during development.
- Lastly `utils` is just a utility folder containing mostly methods, constants, colors or widgets which provide none or little visual, but encapsulate common behavior.
### Extras
- Some extras that can be added are:
    - sqflite database boilerplate.
    
    - L10n and i18n for multi language 

    - Animations utilities.
    
Those have not been included to keep this as lightweight as possible and because not all projects require them. Albeit one could argue neither `dio` for  networking is required in every project. 
### Recommendations
- If more than simple serialization or deserialization is needed `freezed` or `json_serializable` packages are recommended.
- For form management `reactive_forms` is recommended.

## Acknowledgement
 Most of the classes contained in the utils are inspired or implemented at [gskinner](http://blog.gskinner.com/archives/category/flutter). Feel free to visit their blog for awesome content.
 All of the awesome packages used here and their authors.

## Package by feature(or domain)
 Code/package organization is one of the key factors of a good architecture:

 Higher Modularity.
High Cohesion.
Easier Code Navigation.
Minimizes Scope.
Isolation and Encapsulation.

## App (Core)
Handle global dependency injection.
Contain extension functions.
Contain the main framework abstractions.
Initiate in the main application common 3rd party libraries like Analytics, Crash Reporting, etc.



### Error handling 

added to the traditional `Exception` , `Error` and `assert` is
Using Result pattern - A value that represents either a success or a failure,
and Optional
### Assets, Fonts

**If added some assets or fonts**

- Use [FlutterGen](https://github.com/FlutterGen/flutter_gen/)

## Models

**If added some models for api results**

- Use [Freezed](https://pub.dev/packages/freezed), json_serializable or quicktype



## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:twelve/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
   
    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```
------------------------------------------------------------------------------------------------------------------------
# Flutter Architecture Blueprints

<p align="center">
  <img src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/cover.png" />
</p>

<p align="center">
  <a href="https://app.bitrise.io/app/bc96b48850888851">
    <img src="https://app.bitrise.io/app/bc96b48850888851/status.svg?token=kpOAmHRna6NiMkHYsosrlA">
  </a>
  <a href="https://codemagic.io/apps/5f2fd2f0cfa9364ecb48c64e/5f2fd2f0cfa9364ecb48c64d/latest_build">
    <img src="https://api.codemagic.io/apps/5f2fd2f0cfa9364ecb48c64e/5f2fd2f0cfa9364ecb48c64d/status_badge.svg">
  </a>
  <a href="https://github.com/wasabeef/flutter-architecture-blueprints/actions?query=workflow%3A%22Flutter+CI%22">
    <img src="https://github.com/wasabeef/flutter-architecture-blueprints/workflows/Flutter%20CI/badge.svg?branch=master" />
  </a>
  <a href="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints">
    <img src="https://codecov.io/gh/wasabeef/flutter-architecture-blueprints/branch/main/graph/badge.svg?token=9NCYY33KNG" />
  </a>
</p>
<p align="center">
  <a href="https://twitter.com/wasabeef_jp">
    <img src="https://img.shields.io/twitter/follow/wasabeef_jp?label=%40wasabeef_jp&logoColor=000000&style=social" />
  </a>
</p>

Flutter Architecture Blueprints is a project that introduces MVVM architecture and project structure approaches to developing Flutter apps.

## Documentation

- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://flutter.dev/docs)
- [Contributing to Flutter](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/CONTRIBUTING.md)

## Requirements

- [Flutter 1.22.0+ (beta channel)](https://flutter.dev/docs/get-started/install)
- [Dart 2.10.0+](https://github.com/dart-lang/sdk/wiki/Installing-beta-and-dev-releases-with-brew,-choco,-and-apt-get#installing)
- [npm](https://treehouse.github.io/installation-guides/mac/node-mac.html)

## Environment

<img height="520px" src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/MVVM.jpg" align="right" />

**iOS**
- iOS 13+

**Android**
- Android 5.1+
    - minSdkVersion 22
- targetSdkVersion 30

## App architecture
- Base on [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) + [Repository](https://docs.microsoft.com/ja-jp/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design)

## Code Style
- [Effective Dart](https://dart.dev/guides/language/effective-dart)



## Models

**If added some models for api results**

- Use [Freezed](https://pub.dev/packages/freezed)

## Localizations

**If added some localizations (i.g. edited [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n))**

- Use [Official Flutter localization package](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc)

## Git Commit message style

- [Semantic Commit Messages](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)

## Code collections

#### Architecture

|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Base | Using [Riverpod](https://pub.dev/packages/riverpod) + [Hooks](https://pub.dev/packages/flutter_hooks) + [ChangeNotifier](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#changenotifier) + MVVM | [home_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/ui/home/home_page.dart#L41-L47), [home_view_model.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/ui/home/home_view_model.dart), [news_repository.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/repository/news_repository.dart), [news_data_source.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/remote/news_data_source.dart) |
| ✅ | Networking | Using [dio](https://pub.dev/packages/dio) | [app_dio.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/remote/app_dio.dart), [news_data_source_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/data/remote/news_data_source_impl.dart#L16-L33) |
| ✅ | Data | Using [Freezed](https://pub.dev/packages/freezed) | [model classes](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/model) |
| ✅ | Persist Data | Using [shared_preferences](https://pub.dev/packages/shared_preferences) | [theme_data_source_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/local/theme_data_source_impl.dart) |
| ✅ | Constants | Define constants and route names | [constants.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/constants.dart) |
| ✅ | Localization | Switching between two languages with [Intl package](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/edit) | [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n) |
| ✅ | Error handling | Using Result pattern - A value that represents either a success or a failure, including an associated value in each case. | [result.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/model/result.dart), [news_repository_impl.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/data/repository/news_repository_impl.dart#L16), [home_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/e8f0ed78a62e5b27609e60206bd121295a13faac/lib/ui/home/home_page.dart#L51-L63) |

#### UI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Theme | Dynamically Switch between light and dark themes | [app_theme.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/app.dart#L22-L24) |
| ✅ | Font | Using [Google font](https://pub.dev/packages/google_fonts) | [app_theme.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/lib/ui/app_theme.dart#L62) |
| ✅ | Transition | Simple animation between screens using [Hero](https://flutter.dev/docs/development/ui/animations/hero-animations) | [article_item.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/component/article_item.dart#L28), [detail_page.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/be26dc3f7ff27ee2710326abe8ed09893a35386c/lib/ui/detail/datail_page.dart#L13-L24) |

#### Testing
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | API(Repositories) | Using [Mockito](https://pub.dev/packages/mockito) | [view_mode_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/test/ui/view_model_test.dart), [app_theme_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/test/ui/app_theme_test.dart) |
| ✅️ | UI | Using [Mockito](https://pub.dev/packages/mockito) | [widget_test.dart](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/test/ui/widget_test.dart) |
| ✅ | Coverage reports | Send the report to [Codecov](https://codecov.io/) on CI |[codecov.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/codecov.yml), [codecov.sh](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/scripts/codecov.sh), [flutte-ci.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/8e2a373af5e4603aaa75d3c9b9af8150400ab46e/.github/workflows/flutter-ci.yml#L66-L71) |

#### CI
|Working status|Category|Description|Codes|
|:---:|---|---|---|
| ✅ | Git | Git hooks for format and analyze | [package.json](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/package.json#L4-L11), [Makefile](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/Makefile#L9-L12)|
| ✅ | Git | .gitignore settings | [.gitignore](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/.gitignore) |
| ✅ | Build | Using [Codemagic](https://codemagic.io/) |[codemagic.yaml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/codemagic.yaml)|
| ✅ | Build | Using [Bitrise](https://www.bitrise.io/) |[bitrise.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/bitrise.yml)|
| ✅ | Build | Using [Github Actions](https://github.com/features/actions) | [.github/workflows/flutter-ci.yml](https://github.com/wasabeef/flutter-architecture-blueprints/blob/main/.github/workflows/flutter-ci.yml) |

## Getting Started

<img height="540px" src="https://github.com/wasabeef/art/raw/master/flutter-architecture-blueprints/running-app.gif" align="left" />

### Setup

```shell script
$ make setup
$ make build-runner
```

### Make .apk and .ipa file

Android
```shell script
$ make build-android-dev
$ make build-android-prd
```

iOS
```shell script
$ make build-ios-dev
$ make build-ios-prd
```

### Run app
```shell script
$ make run-dev
$ make run-prd
```

<br>

### How to add assets(images..)
1. Add assets
2. Run [FlutterGen](https://github.com/fluttergen)

### How to add localizations
1. Edit [*.arb](https://github.com/wasabeef/flutter-architecture-blueprints/tree/main/lib/l10n) files.
2. Run generate the `flutter pub get`

## Special Thanks.

- [News API](https://newsapi.org/)

**Contributors**
- [lcdsmao](https://github.com/lcdsmao)

------------------------------------------------------------------------------------------------------------------------

# Twelve

[![Very Good Ventures][logo]][very_good_ventures_link]

Developed with 💙 by [Very Good Ventures][very_good_ventures_link] 🦄

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A Very Good Flutter Starter Project created by the [Very Good Ventures Team][very_good_ventures_link].

Generated by the [Very Good CLI][very_good_cli_link] 🤖

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Twelve works on iOS, Android, and Web._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---



[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo]: https://raw.githubusercontent.com/VeryGoodOpenSource/very_good_analysis/main/assets/vgv_logo.png
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
[very_good_ventures_link]: https://verygood.ventures/?utm_source=github&utm_medium=banner&utm_campaign=core




