import 'dart:async';
import 'package:flutter/material.dart';


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
  String get editMedTile => 'Edit MedTile';
  String get takeAfter => 'Take after';
  String get qR => 'QR ';
  String get updated => 'Updated ';
  String get unsuccessful => 'Scan unsuccessful: ';
  String get addMedTile => 'Add MedTile';
  String get nameHint => 'Medication name';
  String get emptyError => 'Please enter a value';
  String get formHint => 'Method of intake';
  String get doseHint => 'Dose per sitting';
  String get dosesHint => 'Total amount of doses in package';
  String get scheduleHint => 'Next daily intake time';
  String get saveMedTile => 'Save MedTile';
  String get deleteMedTile => 'MedTile deleted: ';
  String get undo => 'Undo';
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