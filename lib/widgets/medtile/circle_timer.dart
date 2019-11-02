import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart' as intl;
import 'package:proba123/util/const.dart';
import 'package:proba123/localization.dart';
//TODO: create auto_size_text groupings
import 'package:auto_size_text/auto_size_text.dart';

class Circle extends StatefulWidget {
  final String schedule;

  Circle({Key key, this.schedule}) : super(key: key);

  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')} h';
  }

  @override
  void initState() {
    super.initState();

    nextIntakeTime() {
      intl.DateFormat dateFormat = new intl.DateFormat.Hm();
      DateTime takeTime = dateFormat.parse(widget.schedule);
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
      // print('start: $animationStart');
      return animationStart;
    }

    controller =
        AnimationController(vsync: this, duration: Duration(hours: 24));
    controller.value = nextIntakeTime();
    controller.reverse(from: controller.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return new CustomPaint(
                        painter: TimerPainter(
                            animation: controller,
                            backgroundColor: Colors.transparent,
                            color: Constants.myBlue),
                      );
                    },
                  ),
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
                        AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget child) {
                              return new AutoSizeText(
                                timerString,
                                maxLines: 1,
                                stepGranularity: 8,
                                minFontSize: 16,
                                style: TextStyle(fontSize: 24.0));
                            })
                      ],
                    ),
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

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
