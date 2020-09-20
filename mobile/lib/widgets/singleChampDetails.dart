import 'package:flutter/material.dart';
import 'package:apex/objects/usersProfile.dart';

class SingleChampDetails extends StatelessWidget {
  final ChampionStates ch;
  SingleChampDetails({Key key, @required this.ch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print("On tap " + ch.champName);
              return new ChampionDetails(ch: ch);
            },
          ),
        );
      },
      child: Container(
        height: height * .18,
        width: width,
        padding: EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
            color: Color(0xFF292929),
            border: Border(bottom: BorderSide(width: .7, color: Colors.grey))),
        //color: Colors.black,
        child: Row(
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: Hero(
                tag: 'HeroDetails' + ch.champName,
                child: Container(
                  width: width * .4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/tall/' + ch.champName + '-tall.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Container(
                width: width * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Rank",
                      style: TextStyle(
                          fontFamily: 'robo',
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        height: 7,
                        width: width * .28,
                        child: LinearProgressIndicator(
                          value: 0.7,
                          valueColor: AlwaysStoppedAnimation(Colors.orange),
                          backgroundColor: Color(0x55838383),
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("#2,158",
                        style: TextStyle(
                            fontFamily: 'robo',
                            fontSize: 22.0,
                            color: Colors.white))
                  ],
                )),
            Container(
              width: width * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(ch.kills,
                      style: TextStyle(
                          fontFamily: 'robo',
                          fontSize: 30.0,
                          color: Colors.white)),
                  Text("Kills",
                      style: TextStyle(
                          fontFamily: 'robo',
                          fontSize: 20.0,
                          color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChampionDetails extends StatelessWidget {
  final ChampionStates ch;
  ChampionDetails({Key key, @required this.ch});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container(
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
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      //color: Color(0xFF262626),
                      //padding: EdgeInsets.only(left: width * .05),
                      //height: height * .1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Hero(
                        tag: "HeroDetails1",
                        child: Container(
                          //margin: EdgeInsets.only(top: height*.1),
                          width: width * .6,
                          height: height * .8,
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage('assets/tall/' +
                                      ch.champName +
                                      '-tall.png'))),
                        ),
                      ),
                    ),
                    Container(
                      width: width * .4,
                      //color: Colors.red,
                      padding:
                          EdgeInsets.only(top: height * .1, left: width * .05),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              ch.champName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'apex',
                                  fontSize: 21.0),
                            ),
                          ),
                          SizedBox(
                            height: height * .06,
                          ),
                          Text(
                            ch.kills,
                            style:
                                TextStyle(fontFamily: 'robo', fontSize: 30.0),
                          ),
                          Text(
                            "Kills",
                            style:
                                TextStyle(fontFamily: 'robo', fontSize: 20.0),
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          Text(
                            ch.headshots,
                            style:
                                TextStyle(fontFamily: 'robo', fontSize: 30.0),
                          ),
                          Text(
                            "Headshots",
                            style:
                                TextStyle(fontFamily: 'robo', fontSize: 20.0),
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          Text(
                            ch.matches,
                            style:
                                TextStyle(fontFamily: 'robo', fontSize: 30.0),
                          ),
                          Text(
                            "Matches",
                            style:
                                TextStyle(fontFamily: 'robo', fontSize: 20.0),
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          /*Text(
                            "7178,98",
                            style: TextStyle(fontFamily: 'robo', fontSize: 30.0),
                          ),
                          Text(
                            "Matchs",
                            style: TextStyle(fontFamily: 'robo', fontSize: 20.0),
                          ),*/
                          SizedBox(height: height * .04),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
