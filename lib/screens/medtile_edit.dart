import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';


typedef OnSaveCallBack = Function(
  String name, 
  String form,
  String dose,
  String doses,
  String schedule,
  );

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final MedTile medTile;
  final OnSaveCallBack onSave;

  AddEditScreen({
    Key key,
    @required this.isEditing,
    @required this.onSave,
    this.medTile,
  }) : super(key: key ?? TherapyKeys.addMedTileScreen);

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
                    TextFormField(
                      key: TherapyKeys.nameField,
                      initialValue: isEditing ? widget.medTile.name : '',
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: AppLocalizations().nameHint,
                        border: InputBorder.none,
                        ),
                      validator: (val) {
                          return val.trim().isEmpty
                            ? AppLocalizations().emptyError
                            : null;
                        },
                      onSaved: (value) => _name = value,
                    ),
                    TextFormField(
                      key: TherapyKeys.formField,
                      initialValue: isEditing ? widget.medTile.form : '',
                      decoration: InputDecoration(
                        hintText: AppLocalizations().formHint,
                        border: InputBorder.none,
                        ),
                      validator: (val) {
                          return val.trim().isEmpty
                            ? AppLocalizations().emptyError
                            : null;
                        },
                      onSaved: (value) => _form = value,
                    ),
                    TextFormField(
                      key: TherapyKeys.doseField,
                      initialValue: isEditing ? widget.medTile.dose : '',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: AppLocalizations().doseHint,
                        border: InputBorder.none,
                        ),
                      validator: (val) {
                          return val.trim().isEmpty
                            ? AppLocalizations().emptyError
                            : null;
                        },
                      onSaved: (value) => _dose = value,
                    ),
                    TextFormField(
                      key: TherapyKeys.dosesField,
                      initialValue: isEditing ? widget.medTile.doses : '',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: AppLocalizations().dosesHint,
                        border: InputBorder.none,
                        ),
                      validator: (val) {
                          return val.trim().isEmpty
                            ? AppLocalizations().emptyError
                            : null;
                        },
                      onSaved: (value) => _doses = value,
                    ),
                    TextFormField(
                      key: TherapyKeys.scheduleField,
                      initialValue: isEditing ? widget.medTile.schedule : '',
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: AppLocalizations().scheduleHint,
                        border: InputBorder.none,
                        ),
                      validator: (val) {
                          return val.trim().isEmpty
                            ? AppLocalizations().emptyError
                            : null;
                        },
                      onSaved: (value) => _schedule = value,
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
                    widget.onSave(_name, _form, _dose, _doses, _schedule);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  '${AppLocalizations().saveMedTile}',
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