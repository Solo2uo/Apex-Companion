import 'package:flutter/material.dart';

class WeaponsListDisplay extends StatefulWidget {
  _WeaponsListDisplayState createState() => new _WeaponsListDisplayState();
}

class _WeaponsListDisplayState extends State<WeaponsListDisplay> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: width * .025, right: width * .025),
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: width * .05, top: height * .25),
                height: width * .75,
                width: width * .75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      /*Color(0xFF8C30F6),
                                    Color(0xFF8C30F6),
                                    Color(0xFF8C30F6),
                                    Color(0xFF8C30F6),*/
                      Color(0xFFFD5F3E),
                      Color(0xFFFD5F3E),
                      Color(0xFFFD5F3E),
                      Color(0xFFFD5F3E),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width * .3, top: width * .55),
                width: width * .75,
                //color: Colors.red,
                height: width * .75,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(70 / 360),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/weapons/Hemlock Burst AR.png"),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
