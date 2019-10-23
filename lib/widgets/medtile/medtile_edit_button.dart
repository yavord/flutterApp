import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart'; //TODO: add update snackbar
import 'package:proba123/screens/screens.dart';


class EditButton extends StatelessWidget {
  final String id;

  EditButton({
    Key key, 
    @required this.id,
  }) : super(key: key ?? TherapyKeys.editButton);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedTileBloc, MedTileState>(
      builder: (context, state) {
        final medTile = (state as MedTilesLoaded)
          .medtiles.firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return FlatButton(
          key: TherapyKeys.editButton,
          color: Color(0xff00cf55),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          child: Text(
            AppLocalizations().editMedTile,
            style: TextStyle(color: Colors.white, fontSize: 15.0)
          ),
          onPressed: medTile == null ? null
            : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AddEditScreen(
                      key: TherapyKeys.editScreen,
                      onSave: (name, form) {
                        BlocProvider.of<MedTileBloc>(context).add(
                          UpdateMedTile(medTile.copyWith(name: name, form: form))
                        );
                      },
                      isEditing: true,
                      medTile: medTile,
                    );
                  }
                )
              );
          },
        );
      },
    );
  }
}