import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math' as math;

import 'package:proba123/bloc/timer/timer.dart';
import 'package:proba123/util/const.dart';
import 'package:proba123/localization.dart';


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
                      return CustomPaint(
                        painter: TimerPainter(
                          percentRemaining: state.nextIntake.minsRemaining()/(state.nextIntake.minsTotal()),
                          backgroundColor: Colors.transparent,
                          color: Constants.myBlue,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: FractionalOffset.center,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations().takeAfter,
                        ),
                        BlocBuilder<TimerBloc, TimerState>(
                          builder: (context, state) {
                            final String dayStr = (state.nextIntake.minsRemaining() / 1440)
                              .floor()
                              .toString()
                              .padLeft(1,'0');
                            final String hourStr = ((state.nextIntake.minsRemaining() % 1440) / 60)
                              .floor()
                              .toString()
                              .padLeft(2,'0');
                            final String minStr = (state.nextIntake.minsRemaining() % 60)
                              .floor()
                              .toString()
                              .padLeft(2,'0');
                            return new AutoSizeText(
                                '${dayStr}d:${hourStr}h:${minStr}m',
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

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.percentRemaining,
    this.backgroundColor,
    this.color,
  });

  final double percentRemaining;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - percentRemaining) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return percentRemaining != old.percentRemaining ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
