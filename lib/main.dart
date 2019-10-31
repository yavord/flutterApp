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
  final FirebaseFirestoreRepo firestoreRepo = FirebaseFirestoreRepo();
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
              messagingRepo: messagingRepo,
              data: medications,
            )..add(LoadMedTiles()),
        ),
      ],
      child: TherapyApp(
        authRepo: authRepo,
        messagingRepo: messagingRepo,
        firestoreRepo: firestoreRepo,
      ),
    ),
  );
}

class TherapyApp extends StatelessWidget {
  final FirebaseAuthRepo _authRepo;
  final FirebaseMessagingRepo _messagingRepo;
  final FirebaseFirestoreRepo _firestoreRepo;

  TherapyApp({
    Key key, 
    @required FirebaseAuthRepo authRepo, 
    @required FirebaseMessagingRepo messagingRepo,
    @required FirebaseFirestoreRepo firestoreRepo,
    })
      : assert(authRepo != null),
        assert(messagingRepo != null),
        assert(firestoreRepo != null),
        _firestoreRepo = firestoreRepo,
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
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<TabsBloc>(
                      builder: (context) => TabsBloc(),
                    ),
                    BlocProvider<MessagingBloc>(
                      builder: (context) => MessagingBloc(
                        authRepo: _authRepo,
                        firestoreRepo: _firestoreRepo,
                        messagingRepo: _messagingRepo,
                      )..add(MessagingInit()),
                    )
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