import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statsapp/main.dart';
import 'package:statsapp/userprofile.dart';


class DashBoard extends StatelessWidget {
  static const routeName = '/dashboard_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LEADERBOARD'),
      ),
      body: UserProfile(),
      drawer: Drawer(
          child:ListView(
            children: [
              UserAccountsDrawerHeader(accountName: Text('Narendra Gupta'),
                  accountEmail:Text('guptanarendra1998@gmail.com'),
                  currentAccountPicture:CircleAvatar(backgroundImage:
                  AssetImage("assets/download.png")) )
              ,ListTile(
                leading: Icon(Icons.person),
                title: Text("Email"),
                subtitle: Text("@gmail.com"),
                trailing: Icon(Icons.edit),
              )
              ,ListTile(
                leading: Icon(Icons.phone),
                title: Text("Number"),
                subtitle: Text("9930425305"),
                trailing: Icon(Icons.edit),
              )
              ,ListTile(
                leading: Icon(Icons.location_city),
                title: Text("Address"),
                subtitle: Text("nothing"),
                trailing: Icon(Icons.edit),
              )
            ],
          )
      ),
    );
  }
}
