import 'package:flutter/material.dart';
// import 'package:proba123/util/data/data.dart';

class SidebarDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          // new UserAccountsDrawerHeader(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/img/sky.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   accountName: new Text(name ,style: TextStyle(fontSize: 25, color: Colors.white),),
          //   accountEmail: new Text(name.toLowerCase().replaceAll(" ", ".")+"@gmail.com", style: TextStyle(fontSize: 18.0, color: Colors.white)),
          //   currentAccountPicture: new CircleAvatar(
          //     backgroundImage: AssetImage("assets/img/avatar.jpg"),
          //   ),
          // ),
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
    );
  }
}