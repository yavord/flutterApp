import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/models/models.dart';


class TabsBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.medTiles;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if(event is UpdateTab) {
      yield event.tab;
    }
  }
}