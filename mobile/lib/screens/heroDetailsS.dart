import 'package:flutter/material.dart';
import 'package:apex/objects/ChampClasses.dart';

class HeroDetails extends StatefulWidget {
  final Champ hd;

  HeroDetails({
    Key key,
    @required this.hd,
  }) : super(key: key);
  _HeroDetailsState createState() => new _HeroDetailsState(hd);
}

class _HeroDetailsState extends State<HeroDetails> {
  _HeroDetailsState(this.hero);
  final Champ hero;
  String _page = "info";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
                height: height,
                width: width,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(color: hero.champColor
                      /*gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Color(0XFF922F34),
                        Color(0xFFA1403B),
                        Color(0XFFAE4736),
                        Color(0xFFBB5235),
                      ],
                    ),*/
                      ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height * .57,
                        child: Stack(
                          children: <Widget>[
                            
                            Container(
                              margin: EdgeInsets.only(top: height * .025),
                              height: height * .6,
                              width: width,
                              decoration: BoxDecoration(
                                  //color: Colors.red,

                                  ),
                              child: Hero(
                                  tag: hero.name,
                                  child: Image(
                                      image: AssetImage("assets/small/" +
                                          hero.name.toLowerCase() +
                                          "-small.png"),
                                      fit: BoxFit.contain)),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * .44, left: width * .07),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        hero.name,
                                        style: TextStyle(
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 20)
                                            ],
                                            color: Colors.white,
                                            fontFamily: 'apex',
                                            fontSize: width * .1),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        hero.type,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'teko',
                                            fontSize: width * .065),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      padding: EdgeInsets.all(8),
                                      alignment: Alignment.center,
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
                        height: height * .05,
                        width: width,
                        //color: Colors.green,
                        padding: EdgeInsets.only(
                            left: width * .07, right: width * .07),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: height * .05,
                                width: width * .15,
                                //color: Colors.white,
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _page = "info";
                                    });
                                  },
                                  child: Text("Infos",
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 15)
                                        ],
                                        fontFamily: 'teko',
                                        fontSize: width * .06,
                                        color: this._page == "info"
                                            ? Colors.white
                                            : Colors.black,
                                      )),
                                ))),
                            Container(
                                height: height * .025,
                                width: width * .2,
                                decoration: BoxDecoration(
                                    //color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2.0)))),
                            Container(
                                height: height * .05,
                                width: width * .15,
                                //width: width * .25,
                                //color: Colors.white,
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _page = "skills";
                                    });
                                  },
                                  child: Text(
                                    "Skills",
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 15)
                                        ],
                                        fontFamily: 'teko',
                                        fontSize: width * .06,
                                        color: this._page == "skills"
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ))),
                            Container(
                                height: height * .025,
                                width: width * .2,
                                decoration: BoxDecoration(
                                    //color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xFF000000),
                                            width: 2.0)))),
                            Container(
                                height: height * .05,
                                width: width * .15,

                                //color: Colors.white,
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      //_page = "Skins" ;
                                    });
                                  },
                                  child: Text("Skins",
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 15)
                                        ],
                                        fontFamily: 'teko',
                                        fontSize: width * .06,
                                        color: this._page == "skins"
                                            ? Colors.white
                                            : Colors.black,
                                      )),
                                ))),
                          ],
                        ),
                      ),
                      _setUp()
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _setUp() {
    if (_page == "info") {
      return _heroInfo();
    } else if (_page == "skills") {
      return _heroSkills();
    }
  }

  _heroInfo() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .33,
      width: width * .9,
      margin: EdgeInsets.only(
          top: height * .01,
          bottom: height * .01,
          left: width * .05,
          right: width * .05),
      padding: EdgeInsets.only(left: width * .05, right: width * .05),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      child: Column(
        children: <Widget>[
          Container(
            height: height * .20,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
              //color: Colors.red
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .27,
                  padding:
                      EdgeInsets.only(left: width * .01, right: width * .01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hero.realName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'apex', fontSize: width * .045),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        "Real Name",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'apex',
                            fontSize: width * .033),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .27,
                  padding:
                      EdgeInsets.only(left: width * .01, right: width * .01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hero.age,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'apex', fontSize: width * .045),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        "Age",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'apex',
                            fontSize: width * .033),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .26,
                  padding:
                      EdgeInsets.only(left: width * .01, right: width * .01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hero.gender,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'apex', fontSize: width * .05),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'apex',
                            fontSize: width * .033),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * .13,
            child: Row(
              children: <Widget>[
                Container(
                  width: width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Role : DMG",
                        style: TextStyle(
                            fontFamily: 'apex', fontSize: width * .04),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cost : " + hero.cost,
                        style: TextStyle(
                            fontFamily: 'apex', fontSize: width * .04),
                      ),
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

  _heroMedia() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      height: height * .32,
      width: width * .9,
      margin: EdgeInsets.only(
          top: height * .01,
          bottom: height * .01,
          left: width * .05,
          right: width * .05),
    );
  }

  _heroSkills() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .35,
      width: width,
      //color: Colors.pink,
      padding: EdgeInsets.only(),
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return _singleSkill(hero.abs[index], index);
        },
      ),
    );
  }

  _singleSkill(Ability a, int index) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(
          top: height * .01,
          bottom: height * .01,
        ),
        height: height * .33,
        width: width * .9,
        //color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: width * .9,
              margin: EdgeInsets.only(
                  top: height * .04, left: width * .05, right: width * .05),
              padding: EdgeInsets.only(top: height * .075),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      a.name,
                      style:
                          TextStyle(fontFamily: 'teko', fontSize: width * .1),
                    ),
                  ),
                  Container(
                    child: Text(
                      a.type,
                      style:
                          TextStyle(fontFamily: 'teko', fontSize: width * .05),
                    ),
                  ),
                  Container(
                    child: Text(
                      a.description,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: width * .2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcATop ),
                    image: NetworkImage(a.media),
                  ),
                )),
          ],
        ));
  }

  _heroBio() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height * .35,
        width: width,
        //color: Colors.pink,
        padding: EdgeInsets.only(left: width * .07, right: width * .07),
        child: Container(
          margin: EdgeInsets.only(top: height * .01, bottom: height * .01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
          ),
          height: height * .33,
          padding: EdgeInsets.only(left: width * .01),
          child: ListView(
            children: <Widget>[
              Text(
                  "Before there was Caustic, a scientist named Alexander Nox worked at Humbert Labs, the Frontier’s leading manufacturer of pesticide gases. With a glut of pesticides needed to protect the growing Frontier colonies’ crops, Humbert Labs was constantly on the hunt for better and stronger formulas. Nox was one of their brightest scientists and worked day and night developing new gases. But to make sure they worked, he needed to test them on more than just inert tissue: he needed something living. As he toiled in secret, Nox began to see the beauty in his creations and their ability to destroy anything they touched. But the head of Humbert Labs soon discovered his gruesome experiments, and their confrontation ended with the lab in flames and its chief dead. Today, Nox is missing and presumed deceased. Caustic, meanwhile, now finds new test subjects in the Apex Games, where he puts his gaseous creations to work and observes their effects with great interest.")
            ],
          ),
        ));
  }
}
