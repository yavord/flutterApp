import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:patients_platform/models/barcode.dart';
import 'package:patients_platform/bloc/barcode/barcode.dart';


class BarcodeWidget {
  Widget buildInitialInput() {
    return BarcodeButton();
  }

  Widget buildLoaded() {
    return BarcodeButton();
  }
}

class BarcodeButton extends StatefulWidget {
  const BarcodeButton({
    Key key,
  }) : super(key: key);

  @override
  _BarcodeButtonsState createState() => _BarcodeButtonsState();
}

class _BarcodeButtonsState extends State<BarcodeButton> {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),

      onPressed: getBarcode,
      child: Row(
        children: <Widget>[
          Text("QR "),
          Image.asset(
            "assets/img/qr.png",
            width: 30.0,
            height: 30.0,
          )
        ],
      ),
    );
  }

  void getBarcode() {
    final barcodeBloc = BlocProvider.of<BarcodeBloc>(context);
    barcodeBloc.dispatch(GetBarcode());
  }

  //TODO: Add dispose method to close stream
}