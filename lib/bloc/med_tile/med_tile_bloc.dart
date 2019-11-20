import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'med_tile.dart';
import 'package:firebase_repository/firebase_repo.dart';
import 'package:db_repo/medtile_repo.dart';


class MedTileBloc extends Bloc<MedTileEvent, MedTileState> {
  final FirebaseMessagingRepo _messagingRepo;
  // final MedTileRepo _medTileRepo;

  //TODO: add notification methods that depend on user settings

  MedTileBloc({
    @required FirebaseMessagingRepo messagingRepo,
    // @required MedTileRepo medTileRepo,
    })
      : assert(messagingRepo != null),
      // assert(medTileRepo != null),
      // _medTileRepo = medTileRepo,
      _messagingRepo = messagingRepo;

  @override
  MedTileState get initialState => MedTilesLoading();

  @override
  Stream<MedTileState> mapEventToState(
      MedTileEvent event,
      ) async* {
    if(event is LoadMedTiles) {
      yield* _mapLoadMedTilesToState();
    } else if(event is AddMedTile) {
      yield* _mapAddMedTileToState(event);
    } else if(event is UpdateMedTile) {
      yield* _mapUpdateMedTileToState(event);
    } else if(event is DeleteMedTile) {
      yield* _mapDeleteMedTileToState(event);
    } else if(event is UpdatedMedTiles) {
      yield* _mapUpdatedMedTilesToState(event);
    }
  }

  Stream<MedTileState> _mapLoadMedTilesToState() async* {
    final medTiles = await SqliteRepo.db.getMedTiles();
    yield(MedTilesLoaded(medTiles));
  }

  Stream<MedTileState> _mapAddMedTileToState(
      AddMedTile event,
      ) async* {
        await SqliteRepo.db.addMedTile(event.medTile);
        yield MedTilesLoaded(await SqliteRepo.db.getMedTiles());
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
        await SqliteRepo.db.updateMedTile(event.updatedMedTile);
        yield MedTilesLoaded(await SqliteRepo.db.getMedTiles());
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
        await SqliteRepo.db.deleteMedTileById(event.medTile.toEntity().id);
        yield MedTilesLoaded(await SqliteRepo.db.getMedTiles());
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

  Stream<MedTileState> _mapUpdatedMedTilesToState(UpdatedMedTiles event) async* {
    yield MedTilesLoaded(event.medTiles);
  }

} 
