import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'med_tile.dart';
import 'package:hmss/models/med_tile.dart';
import 'package:hmss/util/data.dart'; //TODO: replace this with server/api


class MedTileBloc extends Bloc<MedTileEvent, MedTileState> {
  final data = medications;

  @override
  MedTileState get initialState => MedTileLoading();

  @override
  Stream<MedTileState> mapEventToState(
      MedTileEvent event,
      ) async* {
    if(event is LoadMedTiles) {
      yield* _mapLoadMedTileToState();
    } else if(event is AddMedTile) {
      yield* _mapAddMedTileToState();
    } else if(event is UpdateMedTile) {
      yield* _mapUpdateMedTileToState();
    } else if(event is MedTile) {
      yield* _mapDeleteMedTileToState();
    }
  }


  //TODO: server/api
  Stream<MedTileState> _mapLoadMedTileToState() async* {
    try{
      final medtile = this.data; //TODO: replace this with server/api
      yield MedTileLoaded(

      );
    } catch(_) {

    }
  }

  Stream<MedTileState> _mapAddMedTileToState() async* {

  }

  Stream<MedTileState> _mapUpdateMedTileToState() async* {

  }

  Stream<MedTileState> _mapDeleteMedTileToState() async* {

  }
}