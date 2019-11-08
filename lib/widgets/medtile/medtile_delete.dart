import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/widgets/widgets.dart';
import 'package:proba123/localization.dart';


class DeleteMedTileButton extends StatelessWidget {
  final String id;

  DeleteMedTileButton({
    Key key,
    @required this.id,
  }) : super(key: key ?? TherapyKeys.deleteButton);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final medTile = (state as MedTilesLoaded)
          .medTiles.firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            ),
          child: Icon(Icons.delete_outline, color: Colors.white,),
          color: Colors.redAccent,
          onPressed: () async {
            BlocProvider.of<MedTileBloc>(context).add(
              DeleteMedTile(medTile)
              );
            Scaffold.of(context).showSnackBar(
              MedTileSnackBar(
                undo: true,
                medTile: medTile,
                content: AppLocalizations().deleteMedTile,
                //TODO: add undo functionality
                onUndo: () =>
                  BlocProvider.of<MedTileBloc>(context).add(
                    AddMedTile(medTile)
                  ),
                ));
          },
        );
      },
    );
  }
}