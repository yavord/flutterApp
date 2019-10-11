import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hmss/keys.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/localization.dart';


typedef OnSaveCallBack = Function(bool complete);

class BarcodeButton extends StatefulWidget {
  final OnSaveCallBack onSave;
  final MedTile medTile;

  BarcodeButton({
    Key key,
    @required this.onSave,
    @required this.medTile,
  }) : super(key : key ?? TherapyKeys.barcodeButton);

  @override
  _BarcodeButtonState createState() => _BarcodeButtonState();
}

class _BarcodeButtonState extends State<BarcodeButton> {
  //TODO: add a globalkey?

  bool _complete;   

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),

      onPressed: getBarcode,
      child: Row(
        children: <Widget>[
          Text(AppLocalizations().qR),
          Image.asset(
            "assets/img/qr.png",
            width: 30.0,
            height: 30.0,
          )
        ],
      ),
    );
  }
}