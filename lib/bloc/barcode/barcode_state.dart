import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:proba123/models/models.dart';


@immutable
abstract class BarcodeState extends Equatable {
  BarcodeState([List props = const[]]) : super(props);
}

class BarcodeLoading extends BarcodeState {}

class BarcodeLoaded extends BarcodeState {
  final String barcode;

  BarcodeLoaded(this.barcode) : super([barcode]);
}

class BarcodeNotLoaded extends BarcodeState {}