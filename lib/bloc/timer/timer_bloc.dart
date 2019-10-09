import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart' as intl;

import 'timer.dart';
import 'package:hmss/models/timer.dart';


class CircleTimerBloc extends Bloc<CircleTimerEvent, CircleTimerState> {
  final String doses;
  final String schedule;

  CircleTimerBloc({
    @required this.doses,
    @required this.schedule,
  });

  @override
  CircleTimerState get initialState => CircleTimerLoading();

  @override
  Stream<CircleTimerState> mapEventToState(
    CircleTimerEvent event,
    ) async* {
    if(event is LoadCircleTimer) {
      yield* _mapLoadCircleTimerToState();
    }
    if(event is UpdateCircleTimer) {
      yield* _mapUpdateCircleTimerToState();
    }
    if(event is ZeroCircleTimer) {
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