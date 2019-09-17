import 'package:bloc/bloc.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

import 'nfc.dart';
import 'package:patients_platform/models/nfc.dart';


class NfcBloc extends Bloc<NfcEvent, NfcState> {
  @override
  NfcState get initialState => NfcInitial();

  @override
  Stream<NfcState> mapEventToState(NfcEvent event) async* {
    if(event is GetNfc) {
      yield NfcLoading();
      final _nfc = await _getNfc();
      yield NfcLoaded(_nfc);
    }
  }

  _getNfc() async {
    NfcData nfc;
    try{
      FlutterNfcReader.read.then((response) {
        nfc = response;
      });
    } on Exception {
      print('unable to complete scan');
    }
    return Nfc(nfc: nfc);
  }
}