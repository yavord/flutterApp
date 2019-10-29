import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:proba123/models/models.dart';


@immutable
abstract class MedTileEvent extends Equatable {
  const MedTileEvent();

  @override
  List<Object> get props => [];
}

class LoadMedTiles extends MedTileEvent {}

class AddMedTile extends MedTileEvent {
  final MedTile medTile;

  const AddMedTile(this.medTile);

  @override
  List<Object> get props => [medTile];

  @override
  String toString() {
    return 'AddMedTile { medTile: $medTile }';
  }
}

class UpdateMedTile extends MedTileEvent {
  final MedTile updatedMedTile;

  const UpdateMedTile(this.updatedMedTile);

  @override
  List<Object> get props => [updatedMedTile];

  @override
  String toString() => 'UpdateMedTile { updatedMedTile : $updatedMedTile }';
}

class DeleteMedTile extends MedTileEvent {
 final MedTile medTile;

 const DeleteMedTile(this.medTile);

  @override 
  List<Object> get props => [medTile];

  String toString() => 'DeleteMedTile { medtile: $medTile }';
}