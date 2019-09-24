import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hmss/widgets/widgets.dart';
import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/models/med_tile.dart';


class MedicTiles extends StatefulWidget {
  final String name;
//  final String icon;
  final String dose;
  final String form;
  final String doses;
  final String schedule;

  MedicTiles(
      {Key key,
      this.name,
//      this.icon,
      this.dose,
      this.form,
      this.doses,
      this.schedule})
      : super(key: key);

  @override
  _MedicTilesState createState() => _MedicTilesState();
}

class _MedicTilesState extends State<MedicTiles> with BarcodeWidget, NfcWidget {
  @override
  void initState() {
    super.initState();
  }

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
                      Text(
                        "${widget.name}",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Take ${widget.dose} ${widget.form}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(" "),
                  Text(
                    "${widget.doses} ${widget.form}s left",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125.0),
              child: Row(
                children: <Widget>[
                  Circle(schedule: widget.schedule),
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
                  onPressed: () {},
                  child: Text(
                    "Take now",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                BlocListener(
                  bloc: BlocProvider.of<BarcodeBloc>(context),
                  listener: (BuildContext context, BarcodeState state) {
                    if (state is BarcodeLoaded) {
                      print('Loaded: ${state.barcode.barcode}');
                    }
                  },
                  child: BlocBuilder(
                    bloc: BlocProvider.of<BarcodeBloc>(context),
                    builder: (BuildContext context, BarcodeState state) {
                      if(state is BarcodeInitial) {
                        return buildInitialInput();
                      } else if (state is BarcodeLoaded) {
                        return buildLoaded();
                      }
                    }, //TODO: make this logic more abstract
                  ),
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
