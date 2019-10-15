import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';


class BarcodeButton extends StatelessWidget {
  // final MedTile medTile;

  BarcodeButton({
    Key key,
    // @required this.medTile,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BarcodeBloc barcodeBloc = BlocProvider.of<BarcodeBloc>(context);
    return BlocBuilder<BarcodeBloc, BarcodeState>(
      builder: (context, state) {
        return OutlineButton(
          key: TherapyKeys.barcodeButton,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          onPressed: () {
            barcodeBloc.dispatch(GetBarcode());
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