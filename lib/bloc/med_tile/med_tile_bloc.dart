import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'med_tile.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/util/data.dart'; //TODO: replace this with server/api


class MedTileBloc extends Bloc<MedTileEvent, MedTileState> {
  List<MedTile> data;

  MedTileBloc({@required this.data});

  @override
  MedTileState get initialState => MedTilesLoading();

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
    } else if(event is DeleteMedTile) {
      yield* _mapDeleteMedTileToState(currentState, event);
    }
  }


  //TODO: server/api
  Stream<MedTileState> _mapLoadMedTileToState() async* {
    try{
      final medtiles = this.data; //TODO: replace this with server/api
      yield MedTilesLoaded(
        medtiles,
      );
    } catch(_) {
      yield MedTilesNotLoaded();
    }
  }

  Stream<MedTileState> _mapAddMedTileToState(
      MedTileState currentState,
      AddMedTile event,
      ) async* {
      if(currentState is MedTilesLoaded) {
        final List<MedTile> updatedMedTiles = List.from(currentState.medtiles)
            ..add(event.medtile);
        yield MedTilesLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  Stream<MedTileState> _mapUpdateMedTileToState(
      MedTileState currentState,
      UpdateMedTile event,
      ) async* {
      if(currentState is MedTilesLoaded) {
        final List<MedTile> updatedMedTiles = currentState.medtiles.map((medtile) {
          return medtile.id == event.updatedMedTile.id ? event.updatedMedTile : medtile;
        }).toList(); //TODO: redo this and understand what it does better
        yield MedTilesLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  Stream<MedTileState> _mapDeleteMedTileToState(
      MedTileState currentState,
      DeleteMedTile event,
      ) async* {
      if(currentState is MedTilesLoaded) {
        final updatedMedTiles =
            currentState.medtiles.where((medtile) => medtile.id != event.medtile.id).toList();
        //TODO: redo/understand this better
        yield MedTilesLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  _saveMedTiles(List<MedTile> medtiles) {
    return data = medtiles;
  }
}