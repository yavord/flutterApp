import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proba123/localization.dart';
import 'package:proba123/models/models.dart';
import 'package:proba123/keys.dart';


class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.redAccent,
      key: TherapyKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == AppTab.medTiles ? Icons.accessibility_new : Icons.assignment_ind,
            key: tab == AppTab.medTiles ? TherapyKeys.medTileTab : TherapyKeys.medIdTab,
          ),
          title: Text(tab == AppTab.medId ? AppLocalizations.of(context).medId : AppLocalizations.of(context).nextIntake),
        );
      }).toList(),
    );
  }
}
