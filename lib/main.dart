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
import 'package:firebase_repository/firebase_repo.dart';
import 'package:proba123/models/models.dart';


void main() {
  BlocSupervisor.delegate = NewBlocDelegate();
  final FirebaseAuthRepo authRepo = FirebaseAuthRepo();
  final FirebaseMessagingRepo messagingRepo = FirebaseMessagingRepo();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (context) =>
            AuthenticationBloc(
              authRepo: authRepo,
            )..add(AuthInit()),
        ),
        BlocProvider<MedTileBloc>(
          builder: (context) =>
            MedTileBloc(
              data: medications,
              messagingRepo: messagingRepo,
            )..add(LoadMedTiles()),
        ),
        BlocProvider<MessagingBloc>(
          builder: (context) =>
            MessagingBloc(
              messagingRepo: messagingRepo
            )..add(MessagingInit()),
        )
      ],
      child: TherapyApp(
        authRepo: authRepo,
        messagingRepo: messagingRepo,
      ),
    ),
  );
}

class TherapyApp extends StatelessWidget {
  final FirebaseAuthRepo _authRepo;
  final FirebaseMessagingRepo _messagingRepo;

  TherapyApp({
    Key key, 
    @required FirebaseAuthRepo authRepo, 
    @required FirebaseMessagingRepo messagingRepo,
    })
      : assert(authRepo != null),
        assert(messagingRepo != null),
        _authRepo = authRepo,
        _messagingRepo = messagingRepo,
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
                return BlocBuilder<MessagingBloc, MessagingState>(
                  builder: (context, state) {
                    if (state is MessagingUninitialized) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (state is MessagingInitlialized) {
                      return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabsBloc>(
                        builder: (context) => TabsBloc(),
                      ),
                    ],
                        child: Home(),
                      );
                    }
                  return Center(child: CircularProgressIndicator(),); //TODO: less of this
                  },
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