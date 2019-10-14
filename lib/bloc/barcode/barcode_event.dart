import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class BarcodeEvent extends Equatable {
  BarcodeEvent([List props = const[]]) : super(props);
}

class GetBarcode extends BarcodeEvent {}

class BarcodeClosed extends BarcodeEvent {}