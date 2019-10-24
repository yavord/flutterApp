import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:proba123/keys.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/screens/screens.dart';
import 'package:proba123/util/const.dart';
import 'package:proba123/util/data/data.dart';
import 'package:proba123/routes.dart';
import 'package:user_repository/auth_repo.dart';
import 'package:proba123/models/models.dart';


void main() {
  BlocSupervisor.delegate = NewBlocDelegate();
  final FireBaseAuthRepo authRepo = FireBaseAuthRepo();
  runApp(
    BlocProvider(
      builder: (context) =>
        AuthenticationBloc(
          authRepo: authRepo,
        )..add(AppStarted()),
        child: TherapyApp(authRepo: authRepo),
    ),
  );
}

class TherapyApp extends StatelessWidget {
  final FireBaseAuthRepo _authRepo;

  TherapyApp({Key key, @required FireBaseAuthRepo authRepo})
      : assert(authRepo != null),
        _authRepo = authRepo,
        super(key: key);

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
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if(state is Unauthenticated) {
                return LoginScreen(authRepo: _authRepo,);
              } 
              if(state is Authenticated) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<MedTileBloc>(
                      builder: (context) {
                        return MedTileBloc(
                          data: medications
                        )..add(LoadMedTiles());
                      },
                    ),
                    BlocProvider<TabsBloc>(
                      builder: (context) => TabsBloc(),
                    ),
                  ],
                  child: Home(),
                 );
                }
              return Center(child: CircularProgressIndicator());
            },
          );
        },
        TherapyAppRoutes.addMedTile: (context) {
          return AddEditScreen(
            key: TherapyKeys.addMedTileScreen,
            onSave: (name, form, dose, doses, schedule) {
              BlocProvider.of<MedTileBloc>(context).add(
                AddMedTile(MedTile(
                    name: name,
                    form: form,
                    dose: dose,
                    doses: doses,
                    schedule: schedule,
                ))
              );
            },
            isEditing: false,
          );
        },
      },
    );
  }
}