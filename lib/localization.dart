import 'dart:async';
import 'package:flutter/material.dart';


class AppLocalizations {
  static AppLocalizations of (BuildContext context) {
    return Localizations.of<AppLocalizations> (
      context,
      AppLocalizations, 
      );
  }

  //Main
  String get appTitle => 'My Therapy';
  String get medId => 'Medical ID';
  String get nextIntake => 'Next Intake';

  //MedTiles
  String get takeDose => 'Take ';
  String get formLeft => 's left';
  String get takeAfter => 'Take after';
  String get qR => 'QR ';
  String get editButton => 'Edit';
  String get unsuccessful => 'Scan unsuccessful: ';
  String get deleteMedTile => 'MedTile deleted: ';
  String get updated => 'Updated ';
  String get undo => 'Undo';

  //Login
  String get loginFail => 'Login Failed';

  //Add/Edit Page
  String get editMedTile => 'Edit MedTile';
  String get addMedTile => 'Add MedTile';
  String get saveMedTile => 'Save MedTile';
  String get emptyError => 'Please enter a value';

  String get name => 'Medication:';
  String get intakeType => 'Intake type:';
  String get dose => 'Dose per intake:';
  String get doses => 'Total doses:';
  String get nextIntakeTime => 'Next intake:';
  String get frequency => 'Days between:';
  
  String get nameHint => 'Medication name';
  String get formHint => 'Method of intake';
  String get doseHint => 'Dose per sitting';
  String get dosesHint => 'Total doses';
  String get scheduleHint => 'Next intake time';
  String get frequencyHint => 'Intake frequency';  
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