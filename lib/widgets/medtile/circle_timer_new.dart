import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/timer/timer.dart';
import 'package:proba123/util/ticker.dart';
import 'package:proba123/util/timer_painter.dart';


  // var string = '8:30';
  
  // var take = DateFormat.Hm().parse(string);

  // print(take.minute + take.hour*60);


class CircleTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.center,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}