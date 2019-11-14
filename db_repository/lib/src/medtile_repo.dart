import 'dart:async';
import 'model/medtile.dart';


abstract class MedTileRepo {
  Future<List<MedTile>> medTiles();

  Future<void> addMedTile(MedTile medTile);

  Future<void> updateMedTile(MedTile medTile);

  Future<void> deleteMedTile(int id);
}