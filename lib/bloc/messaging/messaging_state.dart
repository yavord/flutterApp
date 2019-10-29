import 'package:equatable/equatable.dart';


abstract class MessagingState extends Equatable {
  const MessagingState();

  @override
  List<Object> get props => [];
}

class MessagingUninitialized extends MessagingState {

}

class MessagingInitlialized extends MessagingState {

}