import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hmss/localization.dart';
import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/screens/screens.dart';
import 'package:hmss/util/const.dart';
import 'package:hmss/routes.dart';


void main() {
  BlocSupervisor.delegate = NewBlocDelegate();
  runApp(
    BlocProvider(
      builder: (context) {
        return MedTileBloc()..dispatch(LoadMedTiles());
        },
      child: TherapyApp(),
    )
  );
}

class TherapyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medTileBloc = BlocProvider.of<MedTileBloc>(context);
    return MaterialApp(
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
            ],
            child: Home(),
          );
        }
      },
    );
  }
}