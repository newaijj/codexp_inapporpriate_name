import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text("accountName"), 
          accountEmail: new Text("accountEmail"),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage('https://i.pravatar.cc/150?img=1'),
          ),
        ),
        new ListTile(
          title: new Text('Scroll'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, "/scroll");
          }
        ),
        new ListTile(
          title: new Text('About'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, "/about");
          }
        ),
        new ListTile(
          title: new Text('Animation Demo'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, "/animation");
          }
        ),
        new ListTile(
          title: new Text('User Input Demo'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, "/userInput");
          }
        ),
        new ListTile(
          title: new Text('Mondrian Demo'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, "/mondrian");
          }
        ),
      ],),
    );
  }
}