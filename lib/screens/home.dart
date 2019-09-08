import 'package:flutter/material.dart';
import 'package:patients_platform/screens/daily_goals.dart';
import 'package:patients_platform/screens/medical_id.dart';
import 'package:patients_platform/util/data.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                border: Border( bottom: BorderSide(color: Colors.cyan, width: 2.0))
              ),
              accountName: new Text(name ,style: TextStyle(fontSize: 23),),
              accountEmail: new Text(name.toLowerCase().replaceAll(" ", ".")+"@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage("assets/img/avatar.jpg"),
              ),
            ),
            new ListTile(
              title: new Text("Dashboard", style: TextStyle(fontSize: 18)),
              trailing: new Icon(Icons.home),
            ),
            new ListTile(
              title: new Text("My profile", style: TextStyle(fontSize: 18)),
              trailing: new Icon(Icons.account_circle),
            ),
            new ListTile(
              title: new Text("Notifications", style: TextStyle(fontSize: 18)),
              trailing: new Icon(Icons.notifications),
            ),
            new ListTile(
              title: new Text("All data", style: TextStyle(fontSize: 18)),
              trailing: new Icon(Icons.storage),
            ),
            new ListTile(
              title: new Text("Help", style: TextStyle(fontSize: 18)),
              trailing: new Icon(Icons.info),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/img/avatar.jpg"),
              radius: 30,
            ),
            title: Text(name, style: TextStyle(fontSize: 22),),
            subtitle: Text(name.toLowerCase().replaceAll(" ", ".")+"@gmail.com"),
          ),
          SizedBox(height: 20),

          Align(
            alignment: Alignment.center,
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TabBar(
                    isScrollable: false,
                    labelColor: Theme.of(context).accentColor,
                    labelStyle: TextStyle(fontSize: 17),
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height*2,
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
          )
        ],
      ),
    );
  }
}