import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class NfcEvent extends Equatable {
  const NfcEvent();

  @override
  List<Object> get props => [];
}

class GetNfc extends NfcEvent {}