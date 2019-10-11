import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/screens/medtiles.dart';
import 'package:hmss/widgets/widgets.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/screens/screens.dart';
import 'package:hmss/localization.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabsBloc = BlocProvider.of<TabsBloc>(context);
    return BlocBuilder<TabsBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: (Text(AppLocalizations.of(context).appTitle)),
              // actions: <Widget>[
              //   SidebarDrawer()
              // ],
          ),
          body: activeTab == AppTab.medTiles ? MedTiles() : MedicalID(), 
          //TODO: add AddMedtile "ghost button"
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabsBloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
