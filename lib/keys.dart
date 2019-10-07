import 'package:flutter/foundation.dart';

class TherapyKeys {
  //Screens
  static final home = const Key('__home__');

  //Med Tiles
  static final medTileItem = (String id) => Key('MedTileItem__${id}');
  static final medTileItemName = (String id) => Key('MedTileItem__${id}__Name');
  static final medTileItemDose = (String id) => Key('MedTileItem__${id}__Dose');
  static final medTileItemForm = (String id) => Key('MedTileItem__${id}__Form');
  static final medTileItemDoses = (String id) => Key('MedTileItem__${id}__Doses');
  static final medTileItemSchedule = (String id) => Key('MedTileItem__${id}__Schedule');

  //Tabs
  static final tabs = const Key('__tabs__');
  static final medIdTab = const Key('__medId');

}