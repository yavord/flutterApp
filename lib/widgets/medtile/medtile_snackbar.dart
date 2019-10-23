import 'package:flutter/material.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/localization.dart';

class MedTileSnackBar extends SnackBar {
  MedTileSnackBar({
    Key key,
    VoidCallback onUndo,
    @required MedTile medTile,
    @required String content,
  }) : super(
          key : key,
          content: Text(
            content+'${medTile.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 2),
          // action: SnackBarAction(
          //   label: AppLocalizations().undo,
          //   onPressed: onUndo,
          // ),
  );
}