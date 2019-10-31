import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:proba123/models/models.dart';


@immutable
abstract class NfcState extends Equatable {
  const NfcState();

  @override
  List<Object> get props => [];
}

class NfcInitial extends NfcState {}

class NfcLoading extends NfcState {}

class NfcLoaded extends NfcState {
  final Nfc nfc;

  const NfcLoaded(this.nfc);

  List<Object> get props => [nfc];
}