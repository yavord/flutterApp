import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:proba123/localization.dart';
import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/screens/screens.dart';
import 'package:proba123/util/const.dart';
import 'package:proba123/util/data/data.dart';
import 'package:proba123/routes.dart';


void main() {
  BlocSupervisor.delegate = NewBlocDelegate();
  runApp(
    BlocProvider(
      builder: (context) {
        return MedTileBloc(data: medications)..dispatch(LoadMedTiles());
        },
      child: TherapyApp(),
    )
  );
}

class TherapyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLocalizations().appTitle,
      theme: Constants.lightTheme,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
      ],
      routes: {
        TherapyAppRoutes.home: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TabsBloc>(
                builder: (context) => TabsBloc(),
              ),
              //TODO: add other widgets to main page?
            ],
            child: Home(),
          );
        }
      },
    );
  }
}