import 'package:flutter/foundation.dart';

class TherapyKeys {
  //Home
  static final home = const Key('__home__');

  //MedTiles
  static final medTileList = const Key('__medTileList__');
  static final medTileItem = (String id) => Key('MedTileItem__${id}');
  static final medTileEmptyContainer = const Key('__medTileEmptyContainer__');
  static final medTileItemName = (String id) => Key('MedTileItem__${id}__Name');
  static final medTileItemDose = (String id) => Key('MedTileItem__${id}__Dose');
  static final medTileItemForm = (String id) => Key('MedTileItem__${id}__Form');
  static final medTileItemDoses = (String id) => Key('MedTileItem__${id}__Doses');
  static final medTileItemSchedule = (String id) => Key('MedTileItem__${id}__Schedule');

  //Tabs
  static final tabs = const Key('__tabs__');
  static final medTileTab = const Key('__medTileTabs__');
  static final medIdTab = const Key('__medId');

  //MedTile Buttons
  static final barcodeButton = const Key('__barcodeButton__');
}