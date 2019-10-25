import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart';


class BarcodeButton extends StatelessWidget {
  final String id;

  BarcodeButton({
    Key key,
    @required this.id,
    }) : super(key: key ?? TherapyKeys.barcodeButton);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final medTile = (state as MedTilesLoaded)
          .medTiles.firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return OutlineButton(
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
            ),
          onPressed: () async {
            final barcode = await FlutterBarcodeScanner
              .scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
            if(barcode == medTile.name) {
                int nextDose = int.parse(medTile.doses) - 1;
                BlocProvider.of<MedTileBloc>(context).add(
                  UpdateMedTile(medTile.copyWith(doses: nextDose.toString()))
                  );
                Scaffold.of(context).showSnackBar(
                  MedTileSnackBar(
                    medTile: medTile,
                    content: AppLocalizations().updated,
                    onUndo: () => 
                      BlocProvider.of<MedTileBloc>(context).add(
                        UpdateMedTile(medTile.copyWith(doses: medTile.doses)),
                )));
              } else {
                Scaffold.of(context).showSnackBar(
                  MedTileSnackBar(
                    key: TherapyKeys.snackbar,
                    medTile: medTile,
                    content: AppLocalizations().unsuccessful,
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