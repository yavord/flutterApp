import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:proba123/bloc/timer/timer.dart';
import 'package:proba123/util/ticker.dart';
import 'package:proba123/util/timer_painter.dart';
import 'package:proba123/util/const.dart';
import 'package:proba123/localization.dart';


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
                  child: null,
                ),
                Align(
                  alignment: FractionalOffset.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations().takeAfter,
                        ),
                        BlocBuilder<TimerBloc, TimerState>(
                          builder: (context, state) {
                            final String hourStr = ((state.nextIntake / 60) % 60)
                              .floor()
                              .toString()
                              .padLeft(2,'0');
                            final String minStr = (state.nextIntake % 60)
                              .floor()
                              .toString()
                              .padLeft(2,'0');
                            return new AutoSizeText(
                                '$hourStr:$minStr',
                                maxLines: 1,
                                stepGranularity: 8,
                                minFontSize: 16,
                                style: TextStyle(fontSize: 24.0));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}