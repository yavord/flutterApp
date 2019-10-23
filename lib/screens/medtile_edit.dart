import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart';


typedef OnSaveCallBack = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final MedTile medTile;
  final OnSaveCallBack onSave;

  AddEditScreen({
    Key key,
    @required this.isEditing,
    @required this.onSave,
    this.medTile,
  }) : super(key: key ?? TherapyKeys.editScreen);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _dose;
  String _form;
  String _doses;
  String _schedule;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          isEditing ? AppLocalizations().editMedTile : AppLocalizations().addMedTile,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                ),
                color: Theme.of(context).cardColor,
                child: Column(
                  children: <Widget>[
                    MedTileTextFormField(
                      key: TherapyKeys.nameField,
                      isEditing: isEditing,
                      editing: widget.medTile.name,
                      hint: AppLocalizations().nameHint,
                      save: _name,
                    ),
                    MedTileTextFormField(
                      key: TherapyKeys.formField,
                      isEditing: isEditing,
                      editing: widget.medTile.form,
                      hint: AppLocalizations().formHint,
                      save: _form,
                    ),
                    MedTileTextFormField(
                      key: TherapyKeys.doseField,
                      isEditing: isEditing,
                      editing: widget.medTile.dose,
                      hint: AppLocalizations().doseHint,
                      save: _dose,
                    ),
                    MedTileTextFormField(
                      key: TherapyKeys.dosesField,
                      isEditing: isEditing,
                      editing: widget.medTile.doses,
                      hint: AppLocalizations().dosesHint,
                      save: _doses,
                    ),
                    MedTileTextFormField(
                      key: TherapyKeys.scheduleField,
                      isEditing: isEditing,
                      editing: widget.medTile.schedule,
                      hint: AppLocalizations().scheduleHint,
                      save: _schedule,
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Color(0xff00cf55),
                key: isEditing ? TherapyKeys.saveMedTile : TherapyKeys.saveNewMedTile,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    widget.onSave(_name, _form);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  '${AppLocalizations().saveMedTile} (currently not working)',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}