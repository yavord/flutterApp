import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:hmss/models/med_tile.dart';


@immutable
abstract class MedTileState extends Equatable {
  MedTileState([List props = const[]]) : super(props);
}

class MedTileLoading extends MedTileState {}

class MedTilesLoaded extends MedTileState {
  final List<MedTile> medtiles;

  MedTilesLoaded([this.medtiles = const[]]) : super([medtiles]);
}

class MedTileNotLoaded extends MedTileState {}