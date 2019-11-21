import 'dart:async';
import 'model/model.dart';


abstract class MedTileRepo {
  Future<List<MedTile>> getMedTiles();

  addMedTile(MedTile medTile);

  updateMedTile(MedTile medTile);

  deleteMedTileById(int id);
}