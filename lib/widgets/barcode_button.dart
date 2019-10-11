import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/keys.dart';
import 'package:hmss/localization.dart';

typedef OnSaveCallback = Function(bool complete);

class BarcodeButton extends StatelessWidget {
  final MedTile medTile;
  final OnSaveCallback onSave;

  BarcodeButton({
    Key key,
    @required this.medTile,
    @required this.onSave,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final button = _Button(
          onPress: () {},
        );
        return button;
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onPress,
  }) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      key: TherapyKeys.barcodeButton,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),
      onPressed: onPress,
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