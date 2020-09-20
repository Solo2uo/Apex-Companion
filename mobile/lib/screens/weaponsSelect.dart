import 'package:flutter/material.dart';
import 'package:apex/widgets/dotsIndicator.dart';
import 'package:apex/objects/weaponStats.dart';
import 'package:apex/screens/WeaponDetails.dart';

class WeaponsSelect extends StatefulWidget {
  WeaponsSelect({Key key, @required this.wl}) : super(key: key);

  final List<WeaponDetails> wl;
  _WeaponsSelectState createState() => new _WeaponsSelectState(wl);
}

class _WeaponsSelectState extends State<WeaponsSelect> {
  _WeaponsSelectState(this.wl);
  final List<WeaponDetails> wl;
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width * .3,
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
            SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * .005,
                    ),
                    Container(
                      height: height * .05,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: width * .005,
                          ),
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
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: height * .15, bottom: height * .1),
                      child: Container(
                        height: height * .6,
                        width: width,
                        //color: Colors.red,
                        child: PageView.builder(
                          physics: new AlwaysScrollableScrollPhysics(),
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: wl.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _singleWeaponDisplay(wl[index]);
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * .05,
                      child: new Center(
                        child: new DotsIndicator(
                          controller: _controller,
                          color: Colors.black,
                          itemCount: wl.length,
                          onPageSelected: (int page) {
                            _controller.animateToPage(
                              page,
                              duration: _kDuration,
                              curve: _kCurve,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _singleWeaponDisplay(WeaponDetails details) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                  top: height * .06,
                  left: width * .1,
                  right: width * .1,
                  bottom: height * .01),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
              )),
          Container(
              margin: EdgeInsets.only(
                  top: height * .06,
                  left: width * .09,
                  right: width * .09,
                  bottom: height * .02),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              )),
          Container(
            alignment: Alignment.topCenter,
            height: height * .7,
            margin: EdgeInsets.only(
                top: height * .05,
                left: width * .075,
                right: width * .075,
                bottom: height * .03),
            padding: EdgeInsets.only(
              top: height * .05,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 10),
                ]),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width * .85,
                      child: Text(
                        details.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'apex', fontSize: width * .08),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      details.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'apex',
                          fontSize: width * .04,
                          color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WeaponDetail(details: details)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(color: Color(0XFF922F34), width: 2)),
                        child: Text(
                          "More Details",
                          style: TextStyle(
                              fontFamily: 'apex',
                              color: Color(0XFF922F34),
                              fontSize: width * .04),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Hero(
            tag: "wp" + details.name,
            child: Container(
              alignment: Alignment.bottomLeft,
              height: height * .22,
              margin: EdgeInsets.only(
                  top: height * .15, left: width * .15, right: width * .15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/weapons/' + details.name + '.png'))),
              child: Image(
                image: AssetImage('assets/icons/' + details.ammo + '.png'),
                height: height * .07,
                width: height * .07,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
