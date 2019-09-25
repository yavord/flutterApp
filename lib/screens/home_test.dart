import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmss/bloc/blocs.dart';
import 'package:hmss/models/models.dart';
import 'package:hmss/screens/screens.dart';
import 'package:hmss/util/data.dart';
import 'package:hmss/widgets/widgets.dart';


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final tabsBloc = BlocProvider.of<TabsBloc>(context);
    return BlocBuilder<TabsBloc, AppTab>(
        builder: (context, activeTab) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            drawer: new SidebarDrawer(),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 13),
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/img/avatar.jpg"),
                    radius: 30,
                  ),
                  title: Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  subtitle: Text(name.toLowerCase().replaceAll(" ", ".")+"@gmail.com", style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 20),

                Align(
                  alignment: Alignment.center,
                  child: DefaultTabController(
                    length: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TabBar(
                              indicatorColor: Colors.cyanAccent.shade700,
                              isScrollable: false,
                              labelColor: Colors.cyanAccent.shade700,
                              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                              unselectedLabelColor: Theme.of(context).textTheme.caption.color,
                              tabs: <Widget>[
                                Tab(
                                  text: "Next intake",
                                ),
                                Tab(
                                  text: "Medical ID",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height,
                            child: TabBarView(
                              children: <Widget>[
                                DailyGoals(),
                                MedicalID(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}

