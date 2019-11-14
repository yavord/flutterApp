import 'dart:async';
import 'model/medtile.dart';
import 'entity/medtile_entity.dart';


abstract class MedTileRepo {
  Future<List<MedTile>> medTiles();

  addMedTile(MedTileEntity medTile);

  updateMedTile(MedTileEntity medTile);

  deleteMedTile(int id);
}