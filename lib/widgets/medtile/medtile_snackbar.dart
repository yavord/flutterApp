import 'package:flutter/material.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/localization.dart';

class MedTileSnackBar extends SnackBar {
  MedTileSnackBar({
    Key key,
    VoidCallback onUndo,
    @required bool undo,
    @required MedTile medTile,
    @required String content,
  }) : super(
          key : key,
          content: Text(
            content+'${medTile.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: undo ? Duration(seconds: 5) : Duration(seconds: 2),
          action: undo ? SnackBarAction(
            label: AppLocalizations().undo,
            onPressed: onUndo,
          ) : null,
  );
}