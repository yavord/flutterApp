import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class NfcEvent extends Equatable {
  NfcEvent([List props = const[]]) : super(props);
}

class GetNfc extends NfcEvent {}