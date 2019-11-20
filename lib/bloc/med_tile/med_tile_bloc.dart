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
      yield* _mapLoadMedTilesToState();
    } else if(event is AddMedTile) {
      yield* _mapAddMedTileToState(event);
    } else if(event is UpdateMedTile) {
      yield* _mapUpdateMedTileToState(event);
    } else if(event is DeleteMedTile) {
      yield* _mapDeleteMedTileToState(event);
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
  }

  Stream<MedTileState> _mapUpdateMedTileToState(
      UpdateMedTile event,
      ) async* {
        await SqliteRepo.db.updateMedTile(event.updatedMedTile);
        yield MedTilesLoaded(await SqliteRepo.db.getMedTiles());
  }

  Stream<MedTileState> _mapDeleteMedTileToState(
      DeleteMedTile event,
      ) async* {
        await SqliteRepo.db.deleteMedTileById(event.medTile.toEntity().id);
        yield MedTilesLoaded(await SqliteRepo.db.getMedTiles());
  }
} 
