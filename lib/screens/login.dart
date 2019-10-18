import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/auth_repo.dart';
import 'package:proba123/bloc/login/login.dart';
import 'package:proba123/widgets/widgets.dart';
import 'package:proba123/localization.dart';

class LoginScreen extends StatelessWidget {
  final FireBaseAuthRepo _authRepo;

  LoginScreen({Key key, @required FireBaseAuthRepo authRepo})
      : assert(authRepo != null),
        _authRepo = authRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations().appTitle}'+' Login'),
        backgroundColor: Colors.transparent,
        ),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(authRepo: _authRepo),
        child: LoginForm(authRepo: _authRepo),
      ),
    );
  }
}
