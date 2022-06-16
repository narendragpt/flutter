import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statsapp/LoginPage.dart';
import 'package:statsapp/sortby.dart';
import 'package:statsapp/stats.dart';

import 'dashboard.dart';
import 'dropdown.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late SharedPreferences logindata;
  logindata = await SharedPreferences.getInstance();
  var isLoggedIn = logindata.getBool('login') ?? false;
  runApp(MaterialApp(
    title: 'User App',
    debugShowCheckedModeBanner: false,
    home: isLoggedIn ? DashBoard() : LoginPage(),
    routes: {
      LoginPage.routeName: (context) => LoginPage(),
      DashBoard.routeName: (context) => DashBoard()
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stats(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
              padding: EdgeInsets.only(
                left: 6,
                right: 6,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(
                        8) //                 <--- border radius here
                    ),
              ),
              child: const DropDown(),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text('Sort by')),
            Container(
              margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
              padding: EdgeInsets.only(
                left: 6,
                right: 6,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(
                        8) //                 <--- border radius here
                    ),
              ),
              child: const sortby(),
            ),
          ]),
    );
  }
}
