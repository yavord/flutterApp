import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/widgets/widgets.dart';


class MedTiles extends StatelessWidget {
  MedTiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: add localizations

    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        if (state is MedTilesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MedTilesLoaded) {
          final medTiles = state.medtiles;
          return ListView.builder(
            key: TherapyKeys.medTileList,
            itemCount: medTiles.length,
            itemBuilder: (BuildContext context, int index) {
              final medTile = medTiles[index];
              return MultiBlocProvider(
                providers: [
                  BlocProvider<NfcBloc>(
                    builder: (context) => NfcBloc(),
                  ),
                  BlocProvider<CircleTimerBloc>(
                    builder: (context) => CircleTimerBloc(medTile: medTile),
                    )
                ],
                child: MedTileItem(
                  medTile: medTile,
                ),
              );
            },
          );
        } else {
          return Container(key: TherapyKeys.medTileEmptyContainer);
        }
      },
    );
  }
}