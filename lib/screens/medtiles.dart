import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/keys.dart';
import 'package:hmss/widgets/widgets.dart';


class MedTiles extends StatelessWidget {
  MedTiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final medTileBloc = BlocProvider.of<MedTileBloc>(context);
    //TODO: add localizations

    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        if (state is MedTilesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MedTilesLoaded) {
          final medTiles = state.medtiles;
          return MultiBlocProvider(
            providers: [
              BlocProvider<BarcodeBloc>(
                builder: (context) => BarcodeBloc(),
              ),
              BlocProvider<NfcBloc>(
                builder: (context) => NfcBloc(),
              ),
            ],
            child: ListView.builder(
              key: TherapyKeys.medTileList,
              itemCount: medTiles.length,
              itemBuilder: (BuildContext context, int index) {
                final medTile = medTiles[index];
                return MedTileItem(
                  medTile: medTile,
                );
              },
            ),
          );
        } else {
          return Container(key: TherapyKeys.medTileEmptyContainer);
        }
      },
    );
  }
}