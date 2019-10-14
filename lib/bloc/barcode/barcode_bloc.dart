import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'barcode.dart';
//TODO: make barcode model that is more than just a string
//TODO: add method to convert string to barcode model
// import 'package:proba123/models/models.dart';


class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {

  @override
  BarcodeState get initialState => BarcodeLoading();

  @override
  Stream<BarcodeState> mapEventToState(BarcodeEvent event) async* {
    if(event is GetBarcode) {
      yield* _mapGetBarcodeToState();
    } else if(event is BarcodeClosed) {
      yield* _mapCloseBarcodeToState(currentState, event);
    }
  }

  Stream<BarcodeState> _mapGetBarcodeToState() async* {
    try{
      final barcode =
        await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true);
      yield BarcodeLoaded(barcode);
    } catch(_) {
      yield BarcodeNotLoaded();
    }
  }

  Stream<BarcodeState> _mapCloseBarcodeToState(
    BarcodeState currentState,
    BarcodeEvent event,
  ) async* {
    if(currentState is BarcodeLoaded) {
      
    }
  }
}