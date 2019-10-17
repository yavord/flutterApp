import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart';


class BarcodeButton extends StatelessWidget {
  final String id;

  BarcodeButton({
    Key key,
    @required this.id,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final medTile = (state as MedTilesLoaded)
          .medtiles
          .firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return OutlineButton(
          key: TherapyKeys.barcodeButton,
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
            ),
          onPressed: () async {
            final barcode = await FlutterBarcodeScanner
              .scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
            if(barcode == medTile.name) {
                int nextDose = int.parse(medTile.doses) - 1;
                BlocProvider.of<MedTileBloc>(context)
                  .add(UpdateMedTile(medTile.copyWith(doses: nextDose.toString())));
                Scaffold.of(context).showSnackBar(MedTileSnackBar(
                  medTile: medTile,
                  action: AppLocalizations().updated,
                ));
              } else {
                Scaffold.of(context).showSnackBar(MedTileSnackBar(
                  medTile: medTile,
                  action: AppLocalizations().unsuccessful,
                ));
              }
            },
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
      },
    ); 
  }
}