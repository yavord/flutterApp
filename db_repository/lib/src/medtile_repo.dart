import 'dart:async';
import 'model/medtile.dart';
import 'entity/medtile_entity.dart';


abstract class MedTileRepo {
  Future<List<MedTile>> medTiles();

  addMedTile(MedTile medTile);

  updateMedTile(MedTile medTile);

  deleteMedTile(int id);
}