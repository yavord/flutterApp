import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:hmss/models/med_tile.dart';


@immutable
abstract class MedTileEvent extends Equatable {
  MedTileEvent([List props = const[]]) : super(props);
}

class LoadMedTiles extends MedTileEvent {}

class AddMedTile extends MedTileEvent {
  final MedTile medtile;

  AddMedTile(this.medtile) : super([medtile]);
}

class UpdateMedTile extends MedTileEvent {
  final MedTile updateMedtile;

  UpdateMedTile(this.updateMedtile) : super([updateMedtile]);
}

class DeleteMedTile extends MedTileEvent {
 final MedTile medtile;

 DeleteMedTile(this.medtile) : super([medtile]);
}