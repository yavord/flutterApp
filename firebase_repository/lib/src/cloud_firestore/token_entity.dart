import 'package:equatable/equatable.dart';


class TokenEntity extends Equatable {
  final String token;
  final String user;

  const TokenEntity(this.token, this.user);

  @override
  List<Object> get props => [token, user];

  Map<String, Object> toDocument() {
    return {
      'token' : token,
      'user' : user,
    };
  }
}