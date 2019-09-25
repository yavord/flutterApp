import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/models/models.dart';


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