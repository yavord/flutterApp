import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:user_repository/auth_repo.dart';
import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  final FireBaseAuthRepo _authRepo;

  RegisterScreen({Key key, @required FireBaseAuthRepo authRepo})
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
