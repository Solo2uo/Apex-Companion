import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apex/objects/ChampClasses.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:apex/screens/heroDetailsS.dart';
import 'package:apex/widgets/bottomNavBarC.dart';

class HeroSelect extends StatefulWidget {
  _HeroSelectState createState() => new _HeroSelectState();
}

class _HeroSelectState extends State<HeroSelect> {
  PageController controller = PageController();
  ChampsList chs;
  int _state = 0;

  var currentPageValue = 0.0;
  @override
  void initState() {
    _loadData();
    print(_state);
    super.initState();
  }

  _champPageBuild() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height * .085,
          width: width,
          //color: Colors.grey,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: width,
                child: Text(
                  "CHAMPIONS",
                  style: TextStyle(fontFamily: 'teko', fontSize: width * .085),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: height * .8,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, position) {
              if (position == currentPageValue.floor()) {
                return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(currentPageValue - position),
                    child: _heroPage(chs.champs[position]));
              } else if (position == currentPageValue.floor() + 1) {
                return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(currentPageValue - position),
                    child: _heroPage(chs.champs[position]));
              } else {
                return _heroPage(chs.champs[position]);
              }
            },
            itemCount: chs.champs.length,
          ),
        ),
      ],
    );
  }

  _setUp() {
    if (_state == 1) {
      return Container(
          child: Column(
        children: <Widget>[_champPageBuild()],
      ));
    } else if (_state == 0) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .1,
          child: FlareActor(
            "assets/animations/animationApexWhite.flr",
            animation: "splashMe",
            fit: BoxFit.contain,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

    return Scaffold(
        bottomNavigationBar: BtmNavBar(),
        body: SafeArea(child: Container(child: _setUp())));
  }

  _heroPage(Champ ch) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HeroDetails(hd: ch)));
        },
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: height * .21, left: width * .15),
            height: height * .52,
            width: width * .7,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(spreadRadius: 2.0, color: Colors.grey, blurRadius: 15)
            ], color: ch.champColor, borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            margin: EdgeInsets.only(top: height * .01, left: width * .14),
            height: height * .55,
            decoration: BoxDecoration(
                //color: Colors.grey,
                ),
            child: Hero(
              tag: ch.name,
              child: Image(
                image: AssetImage(
                    "assets/small/" + ch.name.toLowerCase() + "-small.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * .58, left: width * .15),
            width: width * .7,
            //color: Colors.grey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ch.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'apex',
                          fontSize: width * .08),
                    ),
                  ],
                ),
                Text(
                  ch.type,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'apex',
                      fontSize: width * .04),
                )
              ],
            ),
          ),
          /*Container(
            height: height * .07,
            width: width * .3,
            margin: EdgeInsets.only(left: width * .35, top: height * .72),
            decoration: BoxDecoration(
                color: Colors,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget>[
                Text(
                  "More Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'apex',
                    fontSize: height*.02
                  ),
                ),
              ],
            ),
          )*/
        ]),
      ),
    );
  }

  Future<Null> _loadData() async {
    String url = "YOUR_API_URL";
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = jsonDecode(res.body);

    setState(() {
      chs = new ChampsList.fromJson(resBody);
      for (int i = 0; i < chs.champs.length; i++) {
        chs.champs[i].setColors();
        chs.champs[i].setGender();
        chs.champs[i].setCost();
      }
      _state = 1;
    });
  }
}
