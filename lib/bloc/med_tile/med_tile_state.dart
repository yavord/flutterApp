import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:proba123/models/models.dart';


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
}

class MedTilesNotLoaded extends MedTileState {}