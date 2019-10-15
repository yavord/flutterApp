import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:proba123/bloc/blocs.dart';
import 'barcode.dart';
import 'package:proba123/models/models.dart';
//TODO: make barcode model that is more than just a string
//TODO: add method to convert string to barcode model
// import 'package:proba123/models/models.dart';


class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final MedTileBloc medTileBloc;
  StreamSubscription medTileSubscription;

  BarcodeBloc({@required this.medTileBloc});
  // {
  //   medTileSubscription = medTileBloc.state.listen((state){
  //     if(state is MedTilesLoaded) {
  //       dispatch(UpdateTodo)
  //     }
  //   });
  // }

  @override
  BarcodeState get initialState => BarcodeLoading();

  @override
  Stream<BarcodeState> mapEventToState(BarcodeEvent event) async* {
    if(event is GetBarcode) {
      yield* _mapGetBarcodeToState(event);
    } 
  }

  Stream<BarcodeState> _mapGetBarcodeToState(
    GetBarcode event,
  ) async* {
    try{
      // MedTileBloc updatedMedTile = medTileBloc;
      // int nextDose = int.parse(updatedMedTile.doses) - 1;
      // final barcode =
      //   await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true);
      // if(barcode == updatedMedTile.name) {
      //   yield BarcodeLoaded(updatedMedTile.copyWith(doses: nextDose.toString()));
      // }
    } catch(_) {
      yield BarcodeNotLoaded();
    }
  }
}