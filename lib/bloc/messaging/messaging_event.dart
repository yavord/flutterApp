import 'package:equatable/equatable.dart';


abstract class MessagingEvent extends Equatable {
  const MessagingEvent();

  @override
  List<Object> get props => [];
}

class MessagingInit extends MessagingEvent {

}

class MessagingSubscription extends MessagingEvent {
  final String topic;

  const MessagingSubscription(this.topic);
  
  @override
  List<Object> get props => [topic];

  @override
  String toString() => 'Subscribed: { topic: $topic }';
}

class MessagingUnsubscription extends MessagingEvent {
  final String topic;

  const MessagingUnsubscription(this.topic);
  
  @override
  List<Object> get props => [topic];

  @override
  String toString() => 'Unsubscriped: { topic: $topic }';
}