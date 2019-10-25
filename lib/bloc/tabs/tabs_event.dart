import 'package:equatable/equatable.dart';
import 'package:proba123/models/models.dart';
import 'package:meta/meta.dart';


@immutable
abstract class TabEvent extends Equatable {
  const TabEvent();

  @override
  List<Object> get props => [];
}

class UpdateTab extends TabEvent {
  final AppTab tab;

  const UpdateTab(this.tab);

  @override
  List<Object> get props => [tab];
}