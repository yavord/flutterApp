import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class Nfc extends Equatable {
  final NfcData nfc;

  Nfc({
   @required this.nfc
  });

  @override
  List<Object> get props => [nfc];
}