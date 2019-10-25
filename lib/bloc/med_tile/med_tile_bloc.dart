import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'med_tile.dart';
import 'package:proba123/models/models.dart';
// import 'package:proba123/util/data/data.dart'; //TODO: replace this with server/api


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
      yield* _mapAddMedTileToState(event);
    } else if(event is UpdateMedTile) {
      yield* _mapUpdateMedTileToState(event);
    } else if(event is DeleteMedTile) {
      yield* _mapDeleteMedTileToState(event);
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
      AddMedTile event,
      ) async* {
      if(state is MedTilesLoaded) {
        final List<MedTile> updatedMedTiles = List.from((state as MedTilesLoaded).medTiles)
            ..add(event.medTile);
        yield MedTilesLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  Stream<MedTileState> _mapUpdateMedTileToState(
      UpdateMedTile event,
      ) async* {
      if(state is MedTilesLoaded) {
        final List<MedTile> updatedMedTiles = (state as MedTilesLoaded).medTiles.map((medtile) {
          return medtile.id == event.updatedMedTile.id ? event.updatedMedTile : medtile;
        }).toList();
        yield MedTilesLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  Stream<MedTileState> _mapDeleteMedTileToState(
      DeleteMedTile event,
      ) async* {
      if(state is MedTilesLoaded) {
        final updatedMedTiles =
            (state as MedTilesLoaded).medTiles.where((medtile) => medtile.id != event.medTile.id).toList();
        yield MedTilesLoaded(updatedMedTiles);
        _saveMedTiles(updatedMedTiles);
      }
  }

  _saveMedTiles(List<MedTile> medtiles) {
    return data = medtiles;
  }
}