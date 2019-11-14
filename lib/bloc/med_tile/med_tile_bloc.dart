import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'med_tile.dart';
import 'package:firebase_repository/firebase_repo.dart';
import 'package:db_repo/medtile_repo.dart';


class MedTileBloc extends Bloc<MedTileEvent, MedTileState> {
  final FirebaseMessagingRepo _messagingRepo;
  //TODO: add notification methods that depend on user settings

  MedTileBloc({
    @required FirebaseMessagingRepo messagingRepo,
    })
      : assert(messagingRepo != null),
      _messagingRepo = messagingRepo;

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

  Stream<MedTileState> _mapLoadMedTileToState() async* {
    try{
      final medtiles = await SqliteRepo.db.medTiles();
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
        SqliteRepo.db.addMedTile(event.medTile.toEntity());
      // if(state is MedTilesLoaded) {
      //   final List<MedTile> updatedMedTiles = List.from((state as MedTilesLoaded).medTiles)
      //       ..add(event.medTile);
      //   yield MedTilesLoaded(updatedMedTiles);
      //   _saveMedTiles(updatedMedTiles);
      // }
  }

  Stream<MedTileState> _mapUpdateMedTileToState(
      UpdateMedTile event,
      ) async* {
        SqliteRepo.db.updateMedTile(event.updatedMedTile.toEntity());
      // if(state is MedTilesLoaded) {
      //   final List<MedTile> updatedMedTiles = (state as MedTilesLoaded).medTiles.map((medtile) {
      //     return medtile.id == event.updatedMedTile.id ? event.updatedMedTile : medtile;
      //   }).toList();
      //   yield MedTilesLoaded(updatedMedTiles);
      //   _saveMedTiles(updatedMedTiles);
      // }
  }

  Stream<MedTileState> _mapDeleteMedTileToState(
      DeleteMedTile event,
      ) async* {
        SqliteRepo.db.deleteMedTile(event.medTile.toEntity().id);
      // if(state is MedTilesLoaded) {
      //   final updatedMedTiles =
      //       (state as MedTilesLoaded).medTiles.where((medtile) => medtile.id != event.medTile.id).toList();
      //   yield MedTilesLoaded(updatedMedTiles);
      //   _saveMedTiles(updatedMedTiles);
      // }
  }

  // _saveMedTiles(List<MedTile> medtiles) {
  //   return data = medtiles;
  // }
}