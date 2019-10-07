import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hmss/models/models.dart';


class MedTileItem extends StatelessWidget {
  final MedTile medTile;
  final GestureTapCallback takeNow;
  final GestureTapCallback qr;
  final GestureTapCallback nfc;

  MedTileItem({
    Key key,
    @required this.medTile,
    this.takeNow,
    this.qr,
    this.nfc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        
      ),
    );
  }
}