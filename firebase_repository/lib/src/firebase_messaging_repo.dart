import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseMessagingRepo {
  final FirebaseMessaging _firebaseMessaging;

  FirebaseMessagingRepo({FirebaseMessaging firebaseMessaging})
    : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging();

  Future<String> getToken() async {
    final token = _firebaseMessaging.getToken();
    print(token);
    return token;
  }

  Future<void> setConfig() async {
    return _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  Future<void> subscribeToTopic(String topic) async {
    _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeToTopic(String topic) async {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}