import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
      body: SafeArea(
        child: Container(
            decoration: new BoxDecoration(color: Colors.white),
            width: double.infinity,
            child: ListView(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Center(child: new Image.asset("assets/tt.jpg")),
                    Hero(
                      tag: "Hero",
                      child: Container(
                        height: height * .5,
                        child: Stack(
                          children: <Widget>[
                            Diagonal(
                              position: DiagonalPosition.BOTTOM_RIGHT,
                              axis: Axis.horizontal,
                              clipHeight: height * .09,
                              child: Material(
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
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/SeachPlayers');
                              },
                              child: new Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  decoration: new BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.1, 0.5, 0.7, 0.9],
                                        colors: [
                                          /*Color(0xFF8C30F6),
                                      Color(0xFF8C30F6),
                                      Color(0xFF8C30F6),
                                      Color(0xFF8C30F6),*/
                                          Color(0XFF922F34),
                                          Color(0xFFA1403B),
                                          Color(0XFFAE4736),
                                          Color(0xFFBB5235),
                                        ],
                                      ),
                                      border: Border.all(
                                          color: Colors.transparent,
                                          width: 0.0),
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Text("Continue as Guest",
                                          style: new TextStyle(
                                              fontFamily: 'apex',
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: new Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Color(0xFFDA292A), width: 2.0),
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "Login or Register",
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFFDA292A),
                                            fontFamily: 'apex'),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
