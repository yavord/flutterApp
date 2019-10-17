import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/keys.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/screens/medtile_edit.dart';
import 'package:proba123/widgets/widgets.dart';
import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/localization.dart';


class MedTileItem extends StatelessWidget with NfcWidget{
  final MedTile medTile;
  final GestureTapCallback takeNow;
  final GestureTapCallback qr;
  final GestureTapCallback nfc;

  MedTileItem({
    Key key,
    //TODO: add @required circle timer widget bloc 
    @required this.medTile,
    this.takeNow,
    this.qr,
    this.nfc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      key: TherapyKeys.medTileItemName(medTile.id),
                      style: TextStyle(fontSize: 22,),
                      ) 
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    Text(
                      '${AppLocalizations().takeDose}'+'${medTile.dose}',
                      key: TherapyKeys.medTileItemDose(medTile.id),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      medTile.form,
                      key: TherapyKeys.medTileItemForm(medTile.id),
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
                    key: TherapyKeys.medTileItemDoses(medTile.id),
                    style: TextStyle(fontSize: 15, color: Theme.of(context).accentColor,),
                  ),
                  Text(
                    ' ${medTile.form}'+'${AppLocalizations().formLeft}',
                    key: TherapyKeys.medTileItemForm(medTile.id),
                    style: TextStyle(fontSize: 15, color: Theme.of(context).accentColor,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125.0),
              child: Row(
                children: <Widget>[
                  Circle(
                    schedule: medTile.schedule,
                    key: TherapyKeys.medTileItemSchedule(medTile.id),
                  ),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  color: Color(0xff00cf55),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EditScreen(
                            medTile: medTile,
                            onSave: null,
                          );
                        }
                        )
                    );
                  },
                  child: Text(
                    AppLocalizations().editMedTile,
                    style: TextStyle(color: Colors.white, fontSize: 15.0)
                  ),
                ),
                BarcodeButton(
                  id: medTile.id,
                ),
                BlocListener(
                  bloc: BlocProvider.of<NfcBloc>(context),
                  listener: (BuildContext context, NfcState state) {
                    if(state is NfcLoaded) {
                      print('Loaded: ${state.nfc.nfc}');
                    }
                  },
                  child: BlocBuilder(
                    bloc:  BlocProvider.of<NfcBloc>(context),
                    builder: (BuildContext context, NfcState state) {
                      if(state is NfcInitial) {
                        return buildInitialInputNfc();
                      } else if (state is NfcLoading) {
                        return buildLoadingNfc();
                      } else if (state is NfcLoaded) {
                        return buildLoadedNfc();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}