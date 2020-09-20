import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:apex/widgets/bottomNavBarC.dart';

class Test extends StatefulWidget {
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {
  Future<SharedPreferences> _user = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BtmNavBar(),
      appBar: new AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text("Supp"),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/animation');
              },
            ),
            RaisedButton(
              child: Text("navigate"),
              onPressed: () {
                Navigator.of(context).pushNamed('/weaponsCategory');
              },
            ),
            RaisedButton(
              child: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamed("/test4");
              },
            ),
            RaisedButton(
              child: Text("Supp"),
              onPressed: () {
                Navigator.of(context).pushNamed('/SeachPlayers');
              },
            ),
            RaisedButton(
              child: Text("text widget"),
              onPressed: () {
                Navigator.of(context).pushNamed("/weapons");
              },
            ),
            RaisedButton(
              child: Text("Heros"),
              onPressed: () {
                Navigator.of(context).pushNamed("/heros");
              },
            ),
            RaisedButton(
              child: Text("disconnect"),
              onPressed: () {
                
              },
            )
          ],
        ),
      ),
    );
  }

  
}
