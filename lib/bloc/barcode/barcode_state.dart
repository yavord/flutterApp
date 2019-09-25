import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:hmss/models/models.dart';


@immutable
abstract class BarcodeState extends Equatable {
  BarcodeState([List props = const[]]) : super(props);
}

class BarcodeInitial extends BarcodeState {}

class BarcodeLoaded extends BarcodeState {
  final Barcode barcode;

  BarcodeLoaded(this.barcode) : super([barcode]);
}