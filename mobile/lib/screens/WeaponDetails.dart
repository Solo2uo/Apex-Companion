import 'package:flutter/material.dart';

import 'package:apex/objects/weaponStats.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:apex/screens/weaponsSelect.dart';

class WeaponDetail extends StatefulWidget {
  WeaponDetail({Key key, @required this.details}) : super(key: key);
  final WeaponDetails details;
  _WeaponDetailState createState() => new _WeaponDetailState(details);
}

class _WeaponDetailState extends State<WeaponDetail> {
  _WeaponDetailState(this.details);
  final WeaponDetails details;
  String _state = "INFO";
  @override
  void initState() {
    // _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Color(0xFF),
      body: Container(
          height: height * 1.5,
          width: width,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: height * .45,
                    width: width,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: height * .43,
                          width: width,
                          child: Diagonal(
                            clipShadows: [
                              ClipShadow(elevation: 1.0, color: Colors.black)
                            ],
                            axis: Axis.horizontal,
                            clipHeight: height * .125,
                            child: Container(
                              decoration: BoxDecoration(
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
                              ),
                            ),
                          ),
                        ),
                        Hero(
                          tag: "wp" + details.name,
                          child: Container(
                            //height: height * 1,
                            width: width * .9,
                            margin: EdgeInsets.only(
                                left: width * .05,
                                right: width * .05,
                                top: height * .1,
                                bottom: height * .05),
                            padding: EdgeInsets.only(
                                left: width * .02,
                                right: width * .02,
                                top: height * .05,
                                bottom: height * 05),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/weapons/" +
                                        details.name +
                                        ".png"),
                                    fit: BoxFit.contain),
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              height: height * .05,
                              padding: EdgeInsets.only(top: 8.0),
                              width: width * .1,
                              //alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: width * .07,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                            height: height * .07,
                            width: width,
                            child: Center(
                              child: Text(
                                details.name,
                                style: TextStyle(
                                    fontFamily: 'apex',
                                    fontSize: width * .07,
                                    color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * .05,
                    child: Center(
                      child: Text(
                        details.description,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'apex',
                            fontSize: width * .05),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height * .03,
                        left: width * .06,
                        right: width * .06),
                    width: width,
                    height: height * .05,
                    decoration: BoxDecoration(
                        //color: Colors.black,
                        border: Border(
                            top: BorderSide(
                                color: Color(0xFFFF6868), width: 1.0))),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _state = "INFO";
                            });
                          },
                          child: Bevel(
                            cutLength: 2,
                            child: Container(
                              width: width * .2,
                              color: (_state == "INFO")
                                  ? Color(0xFFFF6868)
                                  : Colors.transparent,
                              child: Center(
                                  child: Text(
                                "INFO",
                                style: TextStyle(
                                    color: (_state == "INFO")
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: 'apex',
                                    fontSize: width * .045),
                              )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _state = "Damage";
                            });
                          },
                          child: Bevel(
                            cutLength: 2,
                            child: Container(
                              width: width * .2,
                              margin: EdgeInsets.only(left: width * .14),
                              color: (_state == "Damage")
                                  ? Color(0xFFFF6868)
                                  : Colors.transparent,
                              child: Center(
                                  child: Text(
                                "Damage",
                                style: TextStyle(
                                    color: (_state == "Damage")
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: 'apex',
                                    fontSize: width * .045),
                              )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _state = "Attachs";
                            });
                          },
                          child: Bevel(
                            cutLength: 2,
                            child: Container(
                              width: width * .2,
                              margin: EdgeInsets.only(left: width * .14),
                              color: (_state == "Attachs")
                                  ? Color(0xFFFF6868)
                                  : Colors.transparent,
                              child: Center(
                                  child: Text(
                                "Attachs",
                                style: TextStyle(
                                    color: (_state == "Attachs")
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: 'apex',
                                    fontSize: width * .045),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Container(
                    //height: height * .41,
                    width: width,
                    padding: EdgeInsets.only(
                        left: width * .07,
                        right: width * .07,
                        top: height * .01),
                    child: _changeState(),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  _changeState() {
    if (_state == "INFO") {
      return _infoDisplay();
    } else if (_state == "Damage") {
      return _damageDisplay();
    } else if (_state == "Attachs") {
      return _attachmnt();
    }
  }

  _attachmnt() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Container(
          height: height * .2 * details.attachements.length + height * .005,
          width: width * .85,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: details.attachements.length,
            itemBuilder: (BuildContext context, int index) {
              return _singleAttch(index);
            },
          ),
        )
      ],
    );
  }

  _singleAttch(int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(top: height * .015),
      //height: height * .2,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: width * .02),
                child: Text(
                  details.attachements[index].type,
                  style: TextStyle(color: Colors.grey, fontFamily: 'apex'),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: height * .02, bottom: height * .03),
                alignment: Alignment.center,
                child: Text(details.attachements[index].details,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontFamily: 'apex')),
                width: width * .53,
              ),
              Container(
                width: width * .32,
                height: height * .1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color(0xFFBB5235),
                    image: DecorationImage(
                        image: AssetImage('assets/adds/' +
                            details.attachements[index].type +
                            '.png'))),
              )
            ],
          ),
        ],
      ),
    );
  }

  _damageDisplay() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
            //height: height * .18,
            padding: EdgeInsets.only(
                bottom: height * .03, top: height * .03, left: width * .04),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .38,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "HeadShot DMG",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.dmg.head,
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "DMG",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'apex',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .05,
                ),
                Container(
                  width: width * .38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "BodyShots DMG",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.dmg.body,
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "DMG",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
        /** Second row */
        Container(
            //height: height * .18,
            padding: EdgeInsets.only(
                bottom: height * .03, top: height * .03, left: width * .04),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .38,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "HeadShot Dps",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.dmg.dpsHead,
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "DPS",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'apex',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .05,
                ),
                Container(
                  width: width * .38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "BodyShots DPS",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.dmg.dpsBody,
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "DPS",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.only(
              bottom: height * .03, top: height * .03, left: width * .04),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    //color: Colors.red,
                    width: width * .78,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Damage Multiplier",
                          style:
                              TextStyle(fontFamily: 'apex', color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: width * .2,
                        padding: EdgeInsets.only(
                          left: width * .03,
                        ),
                        child: Text(
                          details.dmg.multiplier,
                          style: TextStyle(
                              color: Colors.black87, fontSize: width * .12),
                        ),
                      ),
                      Container(
                        width: width * .62,
                        padding: EdgeInsets.only(
                            left: width * .05, right: width * .05),
                        child: Center(
                          child: Text(
                              "head shot multiplayer takes the weapons base damage, and multiplies it when you get a head shot."),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              bottom: height * .03, top: height * .03, left: width * .04),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    //color: Colors.red,
                    width: width * .78,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "maxHeadshot Range",
                          style:
                              TextStyle(fontFamily: 'apex', color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: width * .52,
                        padding: EdgeInsets.only(right: width * .05),
                        child: Center(
                          child: Text(
                              "Max headShot range is the maximum range that the bullet have to travel to get a headshot."),
                        ),
                      ),
                      Container(
                        width: width * .3,
                        padding: EdgeInsets.only(
                          left: width * .03,
                        ),
                        child: Text(
                          details.dmg.maxHeadShotRange,
                          style: TextStyle(
                              color: Colors.black87, fontSize: width * .12),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  _infoDisplay() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: height * .03, left: width * .04),
          height: height * .15,
          width: width * .9,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Ammo Type",
                    style: TextStyle(color: Colors.grey, fontFamily: 'apex'),
                  ),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                children: <Widget>[
                  Container(
                      height: height * .07,
                      margin: EdgeInsets.only(right: width * .04),
                      child: Image(
                        height: height * .07,
                        image:
                            AssetImage("assets/icons/" + details.ammo + ".png"),
                        fit: BoxFit.contain,
                      )),
                  Text(
                    details.ammo + " Rounds Ammo",
                    style:
                        TextStyle(fontSize: width * .05, color: Colors.black87),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
            //height: height * .18,
            padding: EdgeInsets.only(
                bottom: height * .03, top: height * .03, left: width * .04),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .41,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Rounds",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.magSize,
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "Shots",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'apex',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .41,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "FireRate",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.rpm,
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "RPM",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
        Container(
            //margin: EdgeInsets.only(bottom: height * .03),

            //height: height * .15,
            padding: EdgeInsets.only(
                top: height * .03, left: width * .04, bottom: height * .03),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .41,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Reload time empty",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.reload.empty + "  ",
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "sec",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .41,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Reload time loaded",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            details.reload.loaded + "  ",
                            style: TextStyle(
                                color: Colors.black87, fontSize: width * .12),
                          ),
                          Text(
                            "sec ",
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'apex'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(bottom: height * .03),
          width: width,
          padding: EdgeInsets.only(top: height * .03, left: width * .04),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Fire Modes",
                    style: TextStyle(color: Colors.grey, fontFamily: 'apex'),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: height * .015),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: height * .14,
                      width: width * .8,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: details.fireModes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _fireMode(height, width, index);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column _fireMode(double height, double width, int index) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: height * .1,
          width: width * .27,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/" +
                      details.fireModes[index].type.toLowerCase() +
                      ".png"))),
        ),
        Text(details.fireModes[index].type,
            style: TextStyle(fontFamily: 'apex', color: Colors.grey))
      ],
    );
  }
}
