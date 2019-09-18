import 'package:flutter/material.dart';
import 'package:hmss/screens/daily_goals.dart';
import 'package:hmss/screens/medical_id.dart';
import 'package:hmss/util/const.dart';
import 'package:hmss/util/data.dart';
import 'package:hmss/widgets/sidebar_drawer.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
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
}

