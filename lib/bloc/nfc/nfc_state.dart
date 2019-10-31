import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:proba123/models/models.dart';


@immutable
abstract class NfcState extends Equatable {
  const NfcState();

  @override
  
}

class NfcInitial extends NfcState {}

class NfcLoading extends NfcState {}

class NfcLoaded extends NfcState {
  final Nfc nfc;

  NfcLoaded(this.nfc) : super([nfc]);
}