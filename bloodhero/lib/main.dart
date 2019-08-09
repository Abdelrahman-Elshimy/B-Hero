// import 'package:bloodhero/screens/home.dart';
import 'package:bloodhero/screens/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:bloodhero/util/utilies.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloodhero/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  bool _seen = await checkSeenStatus();
  Widget _home = OnBoardingPage();
  if (_seen) {
    _home = OnBoardingPage();
  }
  updateStatus();
  runApp(MyApp(_home));
}

class MyApp extends StatefulWidget {
  final Widget _home;
  MyApp(this._home);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B-Hero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // List all of the app's supported locales here
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            getLang(locale.languageCode);
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      home: widget._home,
    );
  }

  void getLang(String local) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('local', local);
  }
}
