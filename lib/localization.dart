import 'dart:async';
import 'package:flutter/material.dart';


//TODO: implement localization in rest of app
class AppLocalizations {
  static AppLocalizations of (BuildContext context) {
    return Localizations.of<AppLocalizations> (
      context,
      AppLocalizations, 
      );
  }

  String get appTitle => 'My Therapy';

  String get medId => 'Medical ID';

  String get nextIntake => 'Next Intake';

  String get takeDose => 'Take ';

  String get formLeft => 's left';

  String get takeNow => 'Take now';

  String get takeAfter => 'Take after';
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  Future<AppLocalizations> load(Locale locale) =>
    Future(() => AppLocalizations());

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => locale.languageCode.toLowerCase().contains('en');
}