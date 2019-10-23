import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart';


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
          .medtiles.firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return OutlineButton(
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
            ),
          child: Icon(Icons.delete),
          onPressed: () {
            BlocProvider.of<MedTileBloc>(context).add(DeleteMedTile(medTile));
          },
        );
      },
    );
  }
}

// BlocProvider.of<TodosBloc>(context).add(DeleteTodo(todo));