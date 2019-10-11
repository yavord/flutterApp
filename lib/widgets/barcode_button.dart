import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/keys.dart';


class BarcodeButton extends StatelessWidget {
  final bool taken;

  BarcodeButton({this.taken, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MedTileBloc medTileBloc = BlocProvider.of(context);

    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final button = _Button;
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
}