import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'barcode.dart';
import 'package:patients_platform/models/barcode.dart';


class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  @override
  BarcodeState get initialState => BarcodeInitial();

  @override
  Stream<BarcodeState> mapEventToState(BarcodeEvent event) async* {
    if(event is GetBarcode) {
      final barcode = await _getBarcode();
      yield BarcodeLoaded(barcode);
    }
  }

  Future<Barcode> _getBarcode() {
    return Future.delayed(
        Duration(seconds: 1),
            () async {
          String barcode;
          try{
            barcode =
            await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true);
          } on Exception{
            barcode = 'Unable to complete scan.';
          }
          return Barcode(
              barcode: barcode
          );
        }
    );
  }
}