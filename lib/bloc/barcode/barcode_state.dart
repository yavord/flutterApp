import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:proba123/models/models.dart';


@immutable
abstract class BarcodeState extends Equatable {
  BarcodeState([List props = const[]]) : super(props);
}

class BarcodeLoading extends BarcodeState {}

class BarcodeLoaded extends BarcodeState {
  final MedTile medTile;

  BarcodeLoaded(this.medTile) : super([medTile]);
}

class BarcodeNotLoaded extends BarcodeState {}