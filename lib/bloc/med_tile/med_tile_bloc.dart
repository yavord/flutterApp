import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'med_tile.dart';
import 'package:hmss/models/med_tile.dart';
import 'package:hmss/util/data.dart'; //TODO: replace this with server/api


class MedTileBloc extends Bloc<MedTileEvent, MedTileState> {
  List<MedTile> data = medications;

  @override
  MedTileState get initialState => MedTileLoading();

  @override
  Stream<MedTileState> mapEventToState(
      MedTileEvent event,
      ) async* {
    if(event is LoadMedTiles) {
      yield* _mapLoadMedTileToState();
    } else if(event is AddMedTile) {
      yield* _mapAddMedTileToState(currentState, event);
    } else if(event is UpdateMedTile) {
      yield* _mapUpdateMedTileToState(currentState, event);
    } else if(event is MedTile) {
      yield* _mapDeleteMedTileToState(currentState, event);
    }
  }


  //TODO: server/api
  Stream<MedTileState> _mapLoadMedTileToState() async* {
    try{
      final medtiles = this.data; //TODO: replace this with server/api
      yield MedTileLoaded(
        medtiles,
      );
    } catch(_) {
      yield MedTileNotLoaded();
    }
  }

  Stream<MedTileState> _mapAddMedTileToState(
      MedTileState currentState,
      AddMedTile event,
      ) async* {
      if(currentState is MedTileLoaded) {
        final List<MedTile> updatedMedTiles = List.from(currentState.medtiles)
            ..add(event.medtile);
        yield MedTileLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  Stream<MedTileState> _mapUpdateMedTileToState(
      MedTileState currentState,
      UpdateMedTile event,
      ) async* {
      if(currentState is MedTileLoaded) {
        final List<MedTile> updatedMedTiles = currentState.medtiles.map(f)
      }
  }

  Stream<MedTileState> _mapDeleteMedTileToState(
      MedTileState currentState,
      DeleteMedTile event,
      ) async* {

  }

  _saveMedTiles(List<MedTile> medtiles) {
    return data = medtiles;
  }
}