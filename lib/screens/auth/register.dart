import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_repository/firebase_repo.dart';
import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  final FirebaseAuthRepo _authRepo;

  RegisterScreen({Key key, @required FirebaseAuthRepo authRepo})
      : assert(authRepo != null),
        _authRepo = authRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.transparent,
        ),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          builder: (context) => RegisterBloc(authRepo: _authRepo),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
