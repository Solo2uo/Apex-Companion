import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  Future<SharedPreferences> _serial = SharedPreferences.getInstance();

  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () => _checkLogginStatus());
  }

  Future<void> _checkLogginStatus() async {
    final SharedPreferences prefs = await _serial;
    if (prefs.get("id") != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          "/SeachPlayers", (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
          "/firstScreen", (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        color: Colors.white,
        child: Column(children: <Widget>[
          Hero(
            tag: "Hero",
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: height * .5,
                child: Column(
                  children: <Widget>[
                    Diagonal(
                      position: DiagonalPosition.BOTTOM_RIGHT,
                      axis: Axis.horizontal,
                      clipHeight: height * .09,
                      child: Container(
                        padding: EdgeInsets.only(top: height * .05),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: height * .05,
                            ),
                            Container(
                              height: height * .2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/apex_white.png'),
                                      fit: BoxFit.contain)),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Text(
                              "Apex Companion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'teko',
                                  fontSize: width * .08),
                            ),
                            SizedBox(
                              height: height * .1,
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              Color(0XFF922F34),
                              Color(0xFFA1403B),
                              Color(0XFFAE4736),
                              Color(0xFFBB5235),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  child: FlareActor(
                    "assets/animations/animationApexWhite.flr",
                    animation: "splashMe",
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  "Solo|Duo Team",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'apex',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
