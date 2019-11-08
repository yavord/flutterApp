import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/widgets/widgets.dart';


typedef OnSaveCallBack = Function(
  String name, 
  String form,
  String dose,
  String doses,
  String schedule,
  int frequency,
  DateTime start,
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
  int _frequency;
  DateTime _start;

  bool get isEditing => widget.isEditing;
  TextStyle style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

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
                    PaddingRowTop(
                      localization: AppLocalizations().name,
                      formField: TextFormField(
                        key: TherapyKeys.nameField,
                        initialValue: isEditing ? widget.medTile.name : '',
                        decoration: InputDecoration(
                          hintText: AppLocalizations().nameHint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                            ),
                          ),
                        validator: (val) {
                            return val.trim().isEmpty
                              ? AppLocalizations().emptyError
                              : null;
                          },
                        onSaved: (value) => _name = value,
                      ),
                    ),
                    PaddingRowTop(
                      localization: AppLocalizations().intakeType,
                      formField: TextFormField(
                        key: TherapyKeys.formField,
                        initialValue: isEditing ? widget.medTile.form : '',
                        decoration: InputDecoration(
                          hintText: AppLocalizations().formHint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                            ),
                          ),
                        validator: (val) {
                            return val.trim().isEmpty
                              ? AppLocalizations().emptyError
                              : null;
                          },
                        onSaved: (value) => _form = value,
                      ),
                    ),
                    PaddingRowTop(
                      localization: AppLocalizations().dose,
                      formField: TextFormField(
                        key: TherapyKeys.doseField,
                        initialValue: isEditing ? widget.medTile.dose : '',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: AppLocalizations().doseHint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                            ),
                          ),
                        validator: (val) {
                            return val.trim().isEmpty
                              ? AppLocalizations().emptyError
                              : null;
                          },
                        onSaved: (value) => _dose = value,
                      ),
                    ),
                    PaddingRowTop(
                      localization: AppLocalizations().dose,
                      formField: TextFormField(
                        key: TherapyKeys.dosesField,
                        initialValue: isEditing ? widget.medTile.doses : '',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: AppLocalizations().dosesHint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                            ),
                          ),
                        validator: (val) {
                            return val.trim().isEmpty
                              ? AppLocalizations().emptyError
                              : null;
                          },
                        onSaved: (value) => _doses = value,
                      ),
                    ),
                    PaddingRowTop(
                      localization: AppLocalizations().nextIntakeTime,
                      formField: DateTimeField(
                        key: TherapyKeys.scheduleField,
                        format: DateFormat.Hm(),
                        decoration: InputDecoration(
                          hintText: AppLocalizations().scheduleHint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                            ),
                        ),
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now())
                          );
                          return DateTimeField.convert(time);
                        },
                        validator: (val) {
                          if (val == null) {
                            return AppLocalizations().emptyError;
                          }
                          return null;
                        },
                        onSaved: (value) => _schedule = value.hour.toString()+':'+value.minute.toString(),
                      ),
                    ),
                    PaddingRowBottom(
                      localization: AppLocalizations().frequency,
                      formField: TextFormField(
                        key: TherapyKeys.frequencyField,
                        initialValue: isEditing ? widget.medTile.doses : '',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: AppLocalizations().frequencyHint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                            ),
                          ),
                        validator: (val) {
                            return val.trim().isEmpty
                              ? AppLocalizations().emptyError
                              : null;
                          },
                        onSaved: (value) => _frequency = int.parse(value),
                      ),
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
                    widget.onSave(_name, _form, _dose, _doses, _schedule, _frequency, _start);
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