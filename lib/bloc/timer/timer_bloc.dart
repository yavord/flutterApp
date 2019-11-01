import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';
// import 'dart:math' as math;
import 'package:intl/intl.dart' as intl;

import 'timer.dart';
import 'package:proba123/models/models.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final MedTile medTile;

  TimerBloc({@required this.medTile});

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
  TimerState get initialState => TimerLoading();

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
    ) async* {
    if(event is LoadTimer) {
      yield* _mapLoadTimerToState();
    } else if(event is UpdateTimer) {
      yield* _mapUpdateTimerToState(event);
    } else if(event is ZeroTimer) {
      yield* _mapZeroCircleTimeToState();
    }
  }

  Stream<TimerState> _mapLoadTimerToState() async* {
    try{
      yield TimerLoaded(getAnimationStart());
    } catch(_) {
      yield TimerNotLoaded();
    }
  }

  Stream<TimerState> _mapUpdateTimerToState(
    TimerEvent event,
    ) async* {
    
  }

  Stream<TimerState> _mapZeroCircleTimeToState() async* {
    
  }
}