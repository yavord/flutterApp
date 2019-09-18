import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'barcode.dart';
import 'package:hmss/models/barcode.dart';


class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  @override
  BarcodeState get initialState => BarcodeInitial();

  @override
  Stream<BarcodeState> mapEventToState(BarcodeEvent event) async* {
    if(event is GetBarcode) {
      final _barcode = await _getBarcode();
      yield BarcodeLoaded(_barcode);
    }
  }

  _getBarcode() async {
    String barcode;
    try{
      barcode =
      await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true);
    } on Exception{
      barcode = 'Unable to complete scan.';
    }
    return Barcode(barcode: barcode);
  }
}