import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:hmss/models/nfc.dart';


@immutable
abstract class NfcState extends Equatable {
  NfcState([List props = const[]]) : super(props);
}

class NfcInitial extends NfcState {}

class NfcLoading extends NfcState {}

class NfcLoaded extends NfcState {
  final Nfc nfc;

  NfcLoaded(this.nfc) : super([nfc]);
}