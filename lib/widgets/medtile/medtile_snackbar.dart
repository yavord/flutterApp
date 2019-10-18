import 'package:flutter/material.dart';
import 'package:proba123/models/models.dart';

class MedTileSnackBar extends SnackBar {
  MedTileSnackBar({
    Key key,
    @required MedTile medTile,
    @required String action,
  }) : super(
          key : key,
          content: Text(
            action+'${medTile.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 4),
  );
}