import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apex/objects/weaponStats.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:apex/screens/weaponsSelect.dart';
import 'package:apex/widgets/bottomNavBarC.dart';

class WeaponsCategory extends StatefulWidget {
  _WeaponsCategoryState createState() => new _WeaponsCategoryState();
}

class _WeaponsCategoryState extends State<WeaponsCategory> {
  WeaponsList wl;

  int _state = 0;
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _setUp();
  }

  _setUp() {
    if (_state == 0) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: FlareActor(
                "assets/animations/animationApexWhite.flr",
                animation: "splashMe",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );
    } else {
      return _mainContect();
    }
  }

  _mainContect() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BtmNavBar(),
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              height: height,
              width: width,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: width * .3,
                    height: height,
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
                  Container(
                    padding: EdgeInsets.only(top: height * .01),
                    width: width,
                    height: height,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: height * .015,
                        ),
                        Container(
                          width: width,
                          height: height * .12,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: width * .1),
                                margin: EdgeInsets.only(left: width * .15),
                                width: width * .75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Asult Rifles",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Apex',
                                          fontSize: width * .04),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "4 Weapons ",
                                      style: TextStyle(
                                          fontFamily: 'apex',
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: width * .6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/category/ar.png"),
                                        fit: BoxFit.contain)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WeaponsSelect(wl: wl.ars)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * .8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Colors.black38,
                                                offset: Offset(5, 5))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0XFF922F34),
                                            size: width * .08,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width,
                          height: height * .13,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: width * .15),
                                width: width * .75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "shotguns",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Apex',
                                          fontSize: width * .04),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "3 Weapons ",
                                      style: TextStyle(
                                          fontFamily: 'apex',
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: width * .6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/category/shotgun.png"),
                                        fit: BoxFit.contain)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WeaponsSelect(wl: wl.shotguns)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * .8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Colors.black38,
                                                offset: Offset(5, 5))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0XFF922F34),
                                            size: width * .08,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width,
                          height: height * .13,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: width * .15),
                                width: width * .75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "sub Machin guns",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Apex',
                                          fontSize: width * .04),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "3 Weapons ",
                                      style: TextStyle(
                                          fontFamily: 'apex',
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: width * .6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/category/smg.png"),
                                        fit: BoxFit.contain)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WeaponsSelect(wl: wl.smgs)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * .8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Colors.black38,
                                                offset: Offset(5, 5))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0XFF922F34),
                                            size: width * .08,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width,
                          height: height * .13,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: width * .15),
                                width: width * .75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Pistols",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Apex',
                                          fontSize: width * .04),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "3 Weapons ",
                                      style: TextStyle(
                                          fontFamily: 'apex',
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: width * .6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/category/pistol.png"),
                                        fit: BoxFit.contain)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WeaponsSelect(wl: wl.pistols)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * .8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Colors.black38,
                                                offset: Offset(5, 5))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0XFF922F34),
                                            size: width * .08,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width,
                          height: height * .13,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: width * .1),
                                margin: EdgeInsets.only(left: width * .15),
                                width: width * .75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Sniper Rifles",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Apex',
                                          fontSize: width * .04),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "3 Weapons ",
                                      style: TextStyle(
                                          fontFamily: 'apex',
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: width * .6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/category/sniper.png"),
                                        fit: BoxFit.contain)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WeaponsSelect(wl: wl.snipers)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * .8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Colors.black38,
                                                offset: Offset(5, 5))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0XFF922F34),
                                            size: width * .08,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width,
                          height: height * .13,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: width * .15),
                                width: width * .75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Light Machin Gun",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Apex',
                                          fontSize: width * .04),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "4 Weapons ",
                                      style: TextStyle(
                                          fontFamily: 'apex',
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: width * .6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/category/lmg.png"),
                                        fit: BoxFit.contain)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WeaponsSelect(wl: wl.lmgs)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * .8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 20,
                                                color: Colors.black38,
                                                offset: Offset(5, 5))
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color(0XFF922F34),
                                            size: width * .08,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
    );
  }

  Future<Null> _loadData() async {
    String url = "YOUR_API_URL";
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = jsonDecode(res.body);

    setState(() {
      wl = WeaponsList.fromJson(resBody);
      print(wl.weapons[9].name);
      wl.setLists();

      _state = 1;
    });
  }
}
