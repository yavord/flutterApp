import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'timer.dart';
import 'package:proba123/util/ticker.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int nextIntake;
  final Ticker _ticker;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({
    @required Ticker ticker,
    @required this.nextIntake,
  }) :
    assert(ticker != null),
    _ticker = ticker;

  @override
  TimerState get initialState => TimerReady(nextIntake);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if(event is StartTimer) {
      yield* _mapStartTimerToState(event);
    } else if(event is Tick) {
      yield* _mapTickToState(event);
    } else if(event is ResetTimer) {
      yield* _mapResetTimerToState(event);
    } else if(event is ZeroTimer) {
      yield* _mapZeroTimerToState(event);
    }
  }

  @override
  void close() {
    _tickerSubscription?.cancel();
    super.close();
  }

  Stream<TimerState> _mapStartTimerToState(StartTimer start) async* {
    yield TimerRunning(start.nextIntake);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
      .tick(ticks: start.nextIntake)
        .listen((nextIntake) => add(Tick(nextIntake)));
  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield tick.nextIntake > 0 ? TimerRunning(tick.nextIntake) : TimerZero();
  }

  Stream<TimerState> _mapResetTimerToState(ResetTimer reset) async* {
    
  }

  Stream<TimerState> _mapZeroTimerToState(ZeroTimer zero) async* {
    
  }
}