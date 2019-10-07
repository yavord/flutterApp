import 'package:flutter/foundation.dart';

class TherapyKeys {
  static final home = const Key('__home__');

  static final medTileItem = (String id) => Key('MedTileItem__${id}');

  static final tabs = const Key('__tabs__');
  static final medIdTab = const Key('__medId');

}