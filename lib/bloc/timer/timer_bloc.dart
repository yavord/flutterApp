import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:meta/meta.dart';

import 'timer.dart';
import 'package:proba123/util/ticker.dart';
import 'package:proba123/util/timer_painter.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final double nextIntake;
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

  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    
  }

  Stream<TimerState> _mapResetTimerToState(ResetTimer reset) async* {
    
  }

  Stream<TimerState> _mapZeroTimerToState(ZeroTimer zero) async* {
    
  }
}