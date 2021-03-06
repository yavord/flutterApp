import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proba123/bloc/timer/timer_event.dart';

import 'package:proba123/keys.dart';
import 'package:db_repo/medtile_repo.dart';
import 'package:proba123/util/ticker.dart';
import 'package:proba123/widgets/widgets.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/models/models.dart';


class MedTileItem extends StatelessWidget{
  final MedTile medTile;
  final GestureTapCallback edit;
  final GestureTapCallback delete;

  MedTileItem({
    Key key,
    @required this.medTile,
    @required this.edit,
    @required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: TherapyKeys.medTileItem(medTile.id.toString()),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
                      key: TherapyKeys.medTileItemName(medTile.id.toString()),
                      style: TextStyle(fontSize: 22,),
                      ) 
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    Text(
                      '${AppLocalizations().takeDose}'+'${medTile.dose}',
                      key: TherapyKeys.medTileItemDose(medTile.id.toString()),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      medTile.form,
                      key: TherapyKeys.medTileItemForm(medTile.id.toString()),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    medTile.doses,
                    key: TherapyKeys.medTileItemDoses(medTile.id.toString()),
                    style: TextStyle(fontSize: 15, color: Theme.of(context).accentColor,),
                  ),
                  Text(
                    ' ${medTile.form}'+'${AppLocalizations().formLeft}',
                    key: TherapyKeys.medTileItemForm(medTile.id.toString()),
                    style: TextStyle(fontSize: 15, color: Theme.of(context).accentColor,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125.0),
              child: Row(
                children: <Widget>[
                  BlocProvider(
                    builder: (context) => TimerBloc(
                      ticker: Ticker(),
                      nextIntake: NextIntake(
                        frequency: medTile.frequency,
                        schedule: medTile.schedule,
                        start: medTile.start,
                        ),
                      )..add(StartTimer(NextIntake(
                        frequency: medTile.frequency,
                        schedule: medTile.schedule,
                        start: medTile.start,
                        ))),
                      child: CircleTimer(),
                  )
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                EditButton(
                  onTap: edit,
                ),
                TakeNowButton(
                  id: medTile.id,
                ),
                BarcodeButton(
                  id: medTile.id,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
                child: DeleteMedTileButton(
                  onTap: delete,
                ),
            ),
          ],
        ),
      ),
    );
  }
}