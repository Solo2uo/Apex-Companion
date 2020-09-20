import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:apex/objects/usersProfile.dart';

class DailyStatsDisplay extends StatelessWidget {
  final List<DailyStats> st;
  DailyStatsDisplay({Key key, @required this.st}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              /* BackGround image */
              Container(
                height: height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/banga.jpg'),
                        fit: BoxFit.cover)),
                child: new BackdropFilter(
                  filter: new ui.ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.black.withOpacity(0.2)),
                      child: Row(
                        children: <Widget>[
                          //Icon(Icons.arrow_back,color: Colors.white,size: 20.0,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              /* Stats Container */
              Container(
                height: height * .75,
                decoration: BoxDecoration(
                    color: Color(0XFFE4E5E9),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2.0, 2.0),
                          color: Color(0xFF262626),
                          blurRadius: 40.0)
                    ]),
                margin: EdgeInsets.only(top: height * .25),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: st.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StatChart(
                        stat: st[index], height: height, width: width);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StatChart extends StatelessWidget {
  const StatChart({
    Key key,
    @required this.stat,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final DailyStats stat;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: height * .1, left: width * .10, right: width * .10),
      child: Column(
        children: <Widget>[
          Container(
            width: width * .8,
            height: height * .5,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(.5, .5),
                      color: Colors.grey,
                      blurRadius: 15.0),
                ],
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              children: <Widget>[
                Container(
                  height: height * .25,
                  decoration: BoxDecoration(
                    /*boxShadow: [
                      BoxShadow(
                          blurRadius: 3.0, spreadRadius: 1.0)
                    ],*/
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage("assets/bg-sts.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        stat.date.day.toString() +
                            "/" +
                            stat.date.month.toString() +
                            "/" +
                            stat.date.year.toString(),
                        style: TextStyle(
                            fontFamily: 'robo',
                            fontSize: 45.0,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        height: height * .125,
                        width: width * .4,
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(width: 1.0, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              stat.kills.toString(),
                              style: TextStyle(
                                  fontFamily: 'robo',
                                  fontSize: 35.0,
                                  color: Colors.black),
                            ),
                            Text(
                              "Kills",
                              style: TextStyle(
                                  fontFamily: 'robo',
                                  fontSize: 15.0,
                                  color: Colors.black),
                            )
                          ],
                        )),
                    Container(
                      height: height * .125,
                      width: width * .4,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            stat.matchs.toString(),
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: 35.0,
                                color: Colors.black),
                          ),
                          Text(
                            "Matches",
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: 15.0,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: height * .125,
                      width: width * .4,
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1.0, color: Colors.grey))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            stat.headshots.toString(),
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: 35.0,
                                color: Colors.black),
                          ),
                          Text(
                            "HeadShots",
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: 15.0,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: height * .125,
                      width: width * .4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            stat.damage.toString(),
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: 35.0,
                                color: Colors.black),
                          ),
                          Text(
                            "DMG",
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: 15.0,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
