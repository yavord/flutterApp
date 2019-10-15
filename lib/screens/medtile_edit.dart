import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';


typedef OnSaveCallBack = Function(String task, String note);

class EditScreen extends StatefulWidget {
  final MedTile medTile;
  final OnSaveCallBack onSave;

  EditScreen({
    Key key,
    @required this.medTile,
    @required this.onSave,
  }) : super(key: key ?? TherapyKeys.editScreen);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String _name;
  String _dose;
  String _form;
  String _doses;
  String _schedule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}