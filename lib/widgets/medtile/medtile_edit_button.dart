import 'package:flutter/material.dart';

import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';


class EditButton extends StatelessWidget {
  final GestureTapCallback onTap;

  EditButton({
    Key key, 
    @required this.onTap,
  }) : super(key: key ?? TherapyKeys.editButton);

  @override
  Widget build(BuildContext context) {
        return FlatButton(
          color: Color(0xff00cf55),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          child: Text(
            AppLocalizations().editButton,
            style: TextStyle(color: Colors.white, fontSize: 15.0)
          ),
          onPressed: onTap,
        );
  }
}