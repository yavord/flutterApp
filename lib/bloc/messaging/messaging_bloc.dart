import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_repository/firebase_repo.dart';
import 'messaging.dart';


class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final FirebaseMessagingRepo _messagingRepo;

  MessagingBloc({@required FirebaseMessagingRepo messagingRepo})
    : assert(messagingRepo != null),
      _messagingRepo = messagingRepo;

  @override
  MessagingState get initialState => MessagingUninitialized();

  Stream<MessagingState> mapEventToState(
    MessagingEvent event,
  ) async* {
    if (event is MessagingInit) {
      yield* _mapMessagingInitToState();
    } else if (event is MessagingSubscription) {
      yield* _mapMessagingSubscriptionToState(event.topic);
    } else if (event is MessagingUnsubscription) {
      yield* _mapMessagingUnsubscriptionToState(event.topic);
    }
  }

  Stream<MessagingState> _mapMessagingInitToState() async* {
    try{
      await _messagingRepo.getToken();
      await _messagingRepo.setConfig();
      yield MessagingInitlialized();
    } catch (e) {
      print(e);
    }
  }

  Stream<MessagingState> _mapMessagingSubscriptionToState(String topic) async* {
    try{
      if (state is MessagingInitlialized) {
        await _messagingRepo.subscribeToTopic(topic);
        yield MessagingInitlialized();
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<MessagingState> _mapMessagingUnsubscriptionToState(String topic) async* {
    try{
      if (state is MessagingInitlialized) {
        await _messagingRepo.subscribeToTopic(topic);
      }
    } catch (e) {
      print(e);
    }
  }

  //TODO: generate topic with unique ID to send to db
}