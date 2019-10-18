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
import 'package:user_repository/auth_repo.dart';


void main() {
  BlocSupervisor.delegate = NewBlocDelegate();
  runApp(TherapyApp(),);
}

class TherapyApp extends StatelessWidget {
  final FireBaseAuthRepo _authRepo = FireBaseAuthRepo();

  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (context) {
            return AuthenticationBloc(
              authRepo: _authRepo,
            )..add(AppStarted());
          },
        ),
        BlocProvider<MedTileBloc>(
          builder: (context) {
            return MedTileBloc(
              data: medications
            )..add(LoadMedTiles());
          },
        )
      ],
      child: MaterialApp(
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
                      BlocProvider<TabsBloc>(
                        builder: (context) => TabsBloc(),
                      ),
                      //TODO: add other widgets to main page
                    ],
                    child: Home(),
                   );
                  }
                return Center(child: CircularProgressIndicator());
              },
            );
          }
        },
      ),
    );
  }
}