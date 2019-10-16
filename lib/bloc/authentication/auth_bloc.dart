import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/auth_repo.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepo _authRepository;

  AuthenticationBloc({@required AuthRepo authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _authRepository.isAuthenticated();
      if (!isSignedIn) {
        await _authRepository.authenticate();
      }
      final userId = await _authRepository.getUserId();
      yield Authenticated(userId);
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
