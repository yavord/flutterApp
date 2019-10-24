import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/screens/screens.dart';


class EditButton extends StatelessWidget {
  // final String id;
  final GestureTapCallback onTap;

  EditButton({
    Key key, 
    // @required this.id,
    @required this.onTap,
  }) : super(key: key ?? TherapyKeys.editButton);

  @override
  Widget build(BuildContext context) {
        // final medTile = (state as MedTilesLoaded)
        //   .medtiles.firstWhere((medTile) => medTile.id == id, orElse: () => null);
        return FlatButton(
          color: Color(0xff00cf55),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          child: Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 15.0)
          ),
          onPressed: onTap,
          // medTile == null ? null
          //   : () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return AddEditScreen(
          //             key: TherapyKeys.editScreen,
          //             onSave: (name, form, dose, doses, schedule) {
          //               BlocProvider.of<MedTileBloc>(context).add(
          //                 UpdateMedTile(medTile.copyWith(
          //                   name: name,
          //                   form: form,
          //                   dose: dose,
          //                   doses: doses, 
          //                   schedule: schedule,
          //                 ))
          //               );
          //             },
          //             isEditing: true,
          //             medTile: medTile,
          //           );
          //         }
          //       )
          //     );
          // },
        );
  }
}