import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:db_repo/medtile_repo.dart';


@immutable
abstract class MedTileState extends Equatable {
  const MedTileState();

  @override
  List<Object> get props => [];
}

class MedTilesLoading extends MedTileState {}

class MedTilesLoaded extends MedTileState {
  final List<MedTile> medTiles;

  const MedTilesLoaded(this.medTiles);

  List<Object> get props => [medTiles];

  @override
  String toString() {
    return 'MedTilesLoaded { medtiles: $medTiles }';
  }
}

class MedTilesNotLoaded extends MedTileState {}