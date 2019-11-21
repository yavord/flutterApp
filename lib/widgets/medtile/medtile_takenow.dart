import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart';


class TakeNowButton extends StatelessWidget {
  final int id;

  TakeNowButton({
    Key key,
    @required this.id,
  }) : super(key: key ?? TherapyKeys.takeNowButton);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final medTile = (state as MedTilesLoaded)
          .medTiles.firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return OutlineButton(
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
            ),
          child: Text(AppLocalizations().takeNowButton),
          onPressed: () async {
            int nextDose = int.parse(medTile.doses) - int.parse(medTile.dose);
            BlocProvider.of<MedTileBloc>(context).add(
              UpdateMedTile(medTile.copyWith(doses: nextDose.toString(), start: DateTime.now()))
              );
            Scaffold.of(context).showSnackBar(
              MedTileSnackBar(
                medTile: medTile,
                undo: true,
                content: AppLocalizations().updated,
                onUndo: () => 
                  BlocProvider.of<MedTileBloc>(context).add(
                    UpdateMedTile(medTile.copyWith(doses: medTile.doses)),
                )));
          },
        );
      },
    );
  }
}