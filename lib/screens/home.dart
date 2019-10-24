import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proba123/bloc/blocs.dart';
import 'package:proba123/screens/medtiles.dart';
import 'package:proba123/widgets/widgets.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/screens/screens.dart';
import 'package:proba123/localization.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: (Text(AppLocalizations.of(context).appTitle)),
              actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.add),
              //   iconSize: 42.0,
              //   tooltip: 'Add new MedTile',
              //   onPressed: () {
              //     Navigator.pushNamed(context, TherapyAppRoutes.addMedTile);
              //   },
              // ),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                tooltip: 'Sign out',
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut(),
                  );
                },
              ),
            ],
          ),
          body: activeTab == AppTab.medTiles ? MedTiles() : MedicalID(), 
          //TODO: add AddMedtile "ghost button"
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => BlocProvider.of<TabsBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
