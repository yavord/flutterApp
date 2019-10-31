import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'token_entity.dart';

class FirebaseFirestoreRepo {
  final tokenCollection = Firestore.instance.collection('device_tokens');

  Future<void> addToken(TokenEntity token) {
    return tokenCollection.add(token.toDocument());
  }
}