import 'package:flutter/material.dart';
import 'package:user_repository/auth_repo.dart';
import 'package:proba123/screens/screens.dart';

class CreateAccountButton extends StatelessWidget {
  final FirebaseRepo _authRepo;

  CreateAccountButton({Key key, @required FirebaseRepo authRepo})
      : assert(authRepo != null),
        _authRepo = authRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(authRepo: _authRepo);
          }),
        );
      },
    );
  }
}
