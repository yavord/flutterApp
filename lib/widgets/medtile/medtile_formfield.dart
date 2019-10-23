import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proba123/localization.dart';


class MedTileTextFormField extends TextFormField {
  MedTileTextFormField({
    Key key,
    @required bool isEditing,
    @required String editing,
    @required String hint,
    @required String save,
  }) : super(
          key: key,
          initialValue: isEditing ? editing : '',
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
            ),
          validator: (val) {
              return val.trim().isEmpty
                ? AppLocalizations().emptyError
                : null;
            },
          onSaved: (value) => save = value,
        );
}