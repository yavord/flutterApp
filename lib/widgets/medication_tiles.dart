import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hmss/keys.dart';
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
        elevation: 0,
         color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Container(
                        child: new Icon(
                          FontAwesomeIcons.pills,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 13),
                      Text(medTile.name, 
                      key: TherapyKeys.medTileItemName(medTile.id),
                      style: TextStyle(fontSize: 22,),
                      ) 
                    ],
                    )
                ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}