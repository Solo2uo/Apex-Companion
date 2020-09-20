import 'package:flutter/material.dart';
import 'package:apex/loaders/color_loader_3.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:apex/objects/usersProfile.dart';
import 'package:apex/widgets/singleChampDetails.dart';
//import 'package:apex/widgets/dailyStats.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserProfile extends StatefulWidget {
  final String aid;
  UserProfile({Key key, @required this.aid}) : super(key: key);
  _UserProfileState createState() => new _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserProfileDetails user;

  List<DailyStats> st = new List<DailyStats>();

  int _state = 0;
  String tab = "ChampsStats";
  @override
  void initState() {
    getData(widget.aid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return setUp();
  }

  Widget profileDetails() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(//physics: BouncingScrollPhysics(),
          children: <Widget>[
        Container(
          height: height * .5,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/profileSet/' +
                      user.legend.toLowerCase() +
                      '.jpg'),
                  fit: BoxFit.cover )),
          child: Column(
            children: <Widget>[
              /* Header part */
              Container(
                width: width,
                height: height * .05,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          //padding: EdgeInsets.only(left: 10.0),
                          width: width * .1,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: width * .07,
                          )),
                    ),
                    Container(
                      width: width * .8,
                      alignment: Alignment.center,
                      child: Text(
                        user.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * .065,
                            fontFamily: 'Robo'),
                      ),
                    ),
                  ],
                ),
              ),
              /* Rank & level */
              Container(
                margin: EdgeInsets.only(
                    top: height * 0.1, left: width * .05, right: width * .05),
                //color: Colors.red,
                //height: height * .15,
                //width: width * .8,
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      //height: height * .3,
                      //color: Colors.green,
                      //width: width * .3,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(user.level,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'robo',
                                      color: Colors.white,
                                      fontSize: 90.0)),
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: height * .05, left: 2),
                                //width: width * .1,
                                alignment: Alignment.topLeft,
                                //color: Colors.blue,
                                child: Image(
                                  height: 25.0,
                                  image: AssetImage(
                                    'assets/lvl.png',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height * .01),
                            //color: Colors.red,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Rank : " + user.globalrank,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * .1,
                margin: EdgeInsets.only(top: height * 0.05, left: width * .05),
                //color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            height: 5,
                            width: width * .33,
                            child: LinearProgressIndicator(
                              value: 0.3,
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0xFFDA292A)),
                              backgroundColor: Color(0x55838383),
                            )),
                        SizedBox(height: 5),
                        Text(
                          "38/100",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        /* Stats List */
        Container(
          margin: EdgeInsets.only(top: height * .03, bottom: height * .03),
          width: width,
          height: height * .14,

          //color: Colors.red,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                //height: height * .04,
                width: width * .40,
                decoration: BoxDecoration(
                    //color: Colors.red,
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey))),
                //padding: EdgeInsets.only(left: width*.2,right: width*.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          user.kills,
                          style: TextStyle(fontSize: 34.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "kills",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                //height: height * .04,
                width: width * .40,
                decoration: BoxDecoration(
                    //color: Colors.red,
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey))),
                //padding: EdgeInsets.only(left: width*.2,right: width*.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          user.globalrank,
                          style: TextStyle(fontSize: 34.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "kills Ranking",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: width * .40,
                decoration: BoxDecoration(
                    //color: Colors.red,
                    // border: Border(right: BorderSide(width: 1.0,color: Colors.grey))
                    ),
                //padding: EdgeInsets.only(left: width*.2,right: width*.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "-",
                          style: TextStyle(fontSize: 34.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Wins",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        /* Navigation */
        Container(
          height: height * .07,
          width: width,
          //margin: EdgeInsets.only(top: height * .20),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey),
            ),

            //color: Colors.red
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: width * .02),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tab = "ChampsStats";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: this.tab == "ChampsStats"
                                  ? Colors.orange
                                  : Colors.transparent,
                              width: 4.0)),
                    ),
                    child: Text(
                      "ChampsStats",
                      style: TextStyle(fontFamily: 'Robo', fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width * .02),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      tab = "DailyStats";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: this.tab == "DailyStats"
                                  ? Colors.orange
                                  : Colors.transparent,
                              width: 4.0)),
                    ),
                    child: Text(
                      "DailyStats",
                      style: TextStyle(fontFamily: 'Robo', fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _pageSelector(height, width),
      ]),
    );
  }

  Widget _pageSelector(double height, double width) {
    if (tab == "ChampsStats") {
      return _champStats(height, width);
    } else {
      return _dailyStats(height, width);
    }
  }

  Widget _dailyStats(double height, double width) {
    return Container(
      height: height * .5,
      //padding: EdgeInsets.only(left: width * .03, right: width * .03),
      child: ListView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: st.length,
          itemBuilder: (BuildContext context, int index) {
            return _dailyStatsTile(height, width, st[index]);
          }),
    );
  }

  _dailyStatsTile(double height, double width, DailyStats st) {
    return Container(
      height: height * .1,
      margin: EdgeInsets.only(
          bottom: 5.0, top: 5.0, left: width * .03, right: width * .03),
      decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            )
          ]),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("assets/bg-sts.png"),
                    fit: BoxFit.fitWidth)),
            child: Center(
              child: Text(
                st.date.day.toString() +
                    "/" +
                    st.date.month.toString() +
                    "/" +
                    st.date.year.toString(),
                style: TextStyle(
                    color: Colors.white, fontFamily: "apex", fontSize: 20),
              ),
            ),
          ),
          Container(
            width: width * .5,
            margin: EdgeInsets.only(
                top: height * .005, bottom: height * .005, left: width * .03),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .125,
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.grey))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        st.kills.toString(),
                        style: TextStyle(
                          fontFamily: "robo",
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "kills",
                        style: TextStyle(fontFamily: "apex", fontSize: 10.0),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .125,
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.grey))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        st.matchs.toString(),
                        style: TextStyle(
                          fontFamily: "robo",
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Matchs",
                        style: TextStyle(fontFamily: "apex", fontSize: 10.0),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .125,
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.grey))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        st.damage.toString(),
                        style: TextStyle(
                          fontFamily: "robo",
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "DMG",
                        style: TextStyle(fontFamily: "apex", fontSize: 10.0),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        st.headshots.toString(),
                        style: TextStyle(
                          fontFamily: "robo",
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "HeadShots",
                        style: TextStyle(fontFamily: "apex", fontSize: 8.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _champStats(double height, double width) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFEEF0F3)),
      child: Column(
        children: <Widget>[
          //SizedBox(height: 40.0),
          Container(
            /*margin: EdgeInsets.only(
                      left: width * .05, right: width * .05,bottom: height*.05 ),*/
            height: height * .05,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: .5, color: Colors.grey),
                  top: BorderSide(width: .5, color: Colors.grey)),
              color: Color(0xFF171717),
            ),
            child: Row(
              children: <Widget>[
                //SizedBox(height: 100.0,),
                Container(
                  padding: EdgeInsets.only(left: width * .05),
                  width: width * .4,
                  //color: Colors.red,
                  child: Text(
                    "#Champion",
                    style: TextStyle(
                        fontFamily: 'Robo',
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: width * .05),
                  width: width * .3,
                  //color: Colors.red,
                  child: Text(
                    "#Rank",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Robo',
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          /* First Hero ended */
          Container(
            width: width,
            height: height * 0.18 * user.champs.length,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: user.champs.length,
              itemBuilder: (context, index) {
                return SingleChampDetails(ch: user.champs[index]);
              },
            ),
          )

          /*End Single hero1*/
        ],
      ),
    );
  }

  Widget setUp() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (_state == 0) {
      return Scaffold(
          body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                ],
              ),
            ),
          ],
        ),
      ));
    } else {
      return profileDetails();
    }
  }

  Future<void> getData(String aid) async {
    print("we are here aid = " + aid);
    /* refersh stats */
    String url1 =
        "https://apextab.com/mainpage.php?page=" + aid + "&updatenow=true";
    http.Response res1 = await http.get(Uri.encodeFull(url1), headers: {});

    String url = "https://apextab.com/api/player.php?aid=" + aid;
    print(url);
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    int dailyStCount;
    /*String url2 =
        "https://public-api.tracker.gg/apex/v1/standard/profile/5/bal3outy";
    print(url);
    http.Response res2 = await http.get(Uri.encodeFull(url2), headers: {
      "Accept": "application/json",
      "TRN-Api-Key": "6d1bdce8-3292-4c14-87ea-edff1f7cce59"
    });*/
    setState(() {
      var resBody = json.decode(res.body);
      if (resBody['playerfound']) {
        user = UserProfileDetails.fromJson(resBody);

        user.setChampList();

        //print("legends :" + user.legend);
        //print("something somewhat :" + user.champs[0].champName);
        if (resBody['daily_stats'] != null) {
          Map dailySt = resBody['daily_stats'];

          var dailyStKeys = dailySt.keys.toList();
          if (dailyStKeys.length < 5) {
            dailyStCount = dailyStKeys.length;
          } else {
            dailyStCount = 5;
          }
          print(dailyStCount);
          for (int i = 0; i < dailyStCount; i++) {
            DailyStats st2 =
                DailyStats.fromJson(resBody['daily_stats'][dailyStKeys[i]]);
            st2.date = readTimestamp(int.parse(dailyStKeys[i]));
            st.add(st2);
          }
        }

        /* this part is for the second shit */
        /*var secBody = json.decode(res2.body);
        if(secBody["data"] != null){
          //var champ = secBody["data"]["children"][0];
          //print("the champ name : "+ champ["stats"][0]["displayValue"] );
          //TopChamp(name: champ["metadata"]["legend_name"],kills: champ["stats"][0]["value"],displayRank: champ["stats"][0]["displayRank"],precent: champ["stats"][0]["percentile"]);
        }*/
        _state = 1;
      }
    });
  }

  DateTime readTimestamp(int time) {
    DateTime dd1 =
        new DateTime.fromMillisecondsSinceEpoch(time * 1000 - 86400000);

    return dd1;
  }
}
