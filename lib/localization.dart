import 'dart:async';
import 'package:flutter/material.dart';


class AppLocalizations {
  static AppLocalizations of (BuildContext context) {
    return Localizations.of<AppLocalizations> (
      context,
      AppLocalizations, 
      );
  }

  String get appTitle => 'HMSS';
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  
}