import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:patients_platform/util/data.dart';
import 'package:patients_platform/widgets/medication_tiles.dart';
import 'package:patients_platform/bloc/barcode/barcode.dart';
import 'package:patients_platform/bloc/nfc/nfc.dart';


class DailyGoals extends StatefulWidget {
  
@override
  _DailyGoalsState createState() => _DailyGoalsState();
}

class _DailyGoalsState extends State<DailyGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<BarcodeBloc>(
             builder: (context) => BarcodeBloc()
           ),
          BlocProvider<NfcBloc>(
            builder: (context) => NfcBloc(),
          ),
        ],
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: medications.length,
            itemBuilder: (BuildContext context, int index) {
              Map medication = medications[index];
              return MedicTiles(
                name: medication['name'],
                icon: medication['icon'],
                dose: medication['dose'],
                form: medication['form'],
                doses: medication['doses'],
                schedule: medication['schedule'],
              );
            },
          ),
        ),
    );
  }
}