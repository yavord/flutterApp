import 'dart:async';
import 'model/medtile.dart';


abstract class MedTileRepo {
  Stream<List<MedTile>> medTiles();

  Future<void> addMedTile(MedTile medTile);

  Future<void> updateMedTile(MedTile medTile);

  Future<void> deleteMedTile(MedTile medTile);
}