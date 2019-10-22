import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';


class NfcWidget {
  Widget buildInitialInputNfc(){
    return NfcButton();
  }

  Widget buildLoadingNfc() {
    //TODO: replace this with a dialog box instead of scaffold
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Please place your device over the NFC tag.'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildLoadedNfc() {
    return NfcButton();
  }
}

class NfcButton extends StatefulWidget {
  const NfcButton({
    Key key,
  }) : super(key: key);

  @override
  _NfcButtonState createState() => _NfcButtonState();
}

class _NfcButtonState extends State<NfcButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: null,
        child: Row(children: <Widget>[
          Text("NFC"),
          Image.asset(
            "assets/img/nfc.png",
            width: 30.0,
            height: 30.0,
          )
        ]));
  }

  // void getNfc() {
  //   final nfcBloc = BlocProvider.of<NfcBloc>(context);
  //   nfcBloc.add(GetNfc());
  // }
}