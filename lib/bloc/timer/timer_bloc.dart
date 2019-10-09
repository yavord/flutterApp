import 'package:bloc/bloc.dart';
import 'package:hmss/bloc/med_tile/med_tile.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart' as intl;

import 'timer.dart';
import 'package:hmss/models/timer.dart';


class CircleTimerBloc extends Bloc<CircleTimerEvent, CircleTimerState> {
  final MedTileBloc medTileBloc;
  StreamSubscription medTileSubscription;

  CircleTimerBloc({
    @required this.medTileBloc,
    }) {
    medTileSubscription = medTileBloc.state.listen((state) {
      if (state is MedTilesLoaded) {
        dispatch(UpdateCircleTimer((state.medtiles as MedTilesLoaded).medtiles));
      }
    });
  }

  @override
  CircleTimerState get initialState => CircleTimerLoading();

  @override
  Stream<CircleTimerState> mapEventToState(
    CircleTimerEvent event,
    ) async* {
    if(event is LoadCircleTimer) {
      yield* _mapLoadCircleTimerToState();
    } else if(event is UpdateCircleTimer) {
      yield* _mapUpdateCircleTimerToState();
    } else if(event is ZeroCircleTimer) {
      yield* _mapZeroCircleTimeToState();
    }
  }

  Stream<CircleTimerState> _mapLoadCircleTimerToState() async* {

  }

  Stream<CircleTimerState> _mapUpdateCircleTimerToState() async* {
    
  }

  Stream<CircleTimerState> _mapZeroCircleTimeToState() async* {
    
  }
}