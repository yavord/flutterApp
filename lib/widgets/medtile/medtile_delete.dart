import 'package:flutter/material.dart';

import 'package:proba123/keys.dart';



class DeleteMedTileButton extends StatelessWidget {
  final GestureTapCallback onTap;

  DeleteMedTileButton({
    Key key,
    @required this.onTap,
  }) : super(key: key ?? TherapyKeys.deleteButton);

  @override
  Widget build(BuildContext context) {
        return FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            ),
          child: Icon(Icons.delete_outline, color: Colors.white,),
          color: Colors.redAccent,
          onPressed: onTap,
        );
  }
}
