import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';
// import 'dart:math' as math;
import 'package:intl/intl.dart' as intl;

import 'timer.dart';
import 'package:hmss/models/models.dart';


class CircleTimerBloc extends Bloc<CircleTimerEvent, CircleTimerState> {
  final MedTile medTile;

  CircleTimerBloc({@required this.medTile});

  getAnimationStart() {
    intl.DateFormat dateFormat = new intl.DateFormat.Hm();
    DateTime takeTime = dateFormat.parse(medTile.schedule);
    DateTime now = DateTime.now();
    var hoursLeft = takeTime.hour - now.hour;
    var minutesLeft = takeTime.minute - now.minute;
    if (minutesLeft < 0) {
      hoursLeft -= 1;
      minutesLeft += 60;
    }
    if (hoursLeft > 19) hoursLeft -= 24;
    if (hoursLeft < -5) hoursLeft += 24;
    double animationStart = (hoursLeft * 60 + minutesLeft) / (24 * 60);
    return animationStart;
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
      yield* _mapUpdateCircleTimerToState(currentState, event);
    } else if(event is ZeroCircleTimer) {
      yield* _mapZeroCircleTimeToState();
    }
  }

  Stream<CircleTimerState> _mapLoadCircleTimerToState() async* {
    try{
      yield CircleTimerLoaded(getAnimationStart());
    } catch(_) {
      yield CircleTimerNotLoaded();
    }
  }

  Stream<CircleTimerState> _mapUpdateCircleTimerToState(
    CircleTimerState currentState,
    CircleTimerEvent event,
    ) async* {
    
  }

  Stream<CircleTimerState> _mapZeroCircleTimeToState() async* {
    
  }
}