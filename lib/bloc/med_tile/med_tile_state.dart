import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:hmss/models/med_tile.dart';


@immutable
abstract class MedTileState extends Equatable {
  MedTileState([List props = const[]]) : super(props);
}

class MedTileLoading extends MedTileState {}

class MedTileLoaded extends MedTileState {
  final List<MedTile> medtile;

  MedTileLoaded([this.medtile = const[]]) : super([medtile]);
}

class MedTileNotLoaded extends MedTileState {}