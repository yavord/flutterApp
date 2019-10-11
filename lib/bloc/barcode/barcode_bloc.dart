import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'barcode.dart';
//TODO: make barcode model that is more than just a string
// import 'package:hmss/models/models.dart';


class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {

  @override
  BarcodeState get initialState => BarcodeLoading();

  @override
  Stream<BarcodeState> mapEventToState(BarcodeEvent event) async* {
    if(event is GetBarcode) {
      yield* _mapBarcodeToState();
    }
  }

  Stream<BarcodeState> _mapBarcodeToState() async* {
    try{
      final barcode =
        await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true);
      yield BarcodeLoaded(barcode);
    } catch(_) {
      yield BarcodeNotLoaded();
    }
  }
}