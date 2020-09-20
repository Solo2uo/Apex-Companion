import 'package:flutter/material.dart';
import 'package:apex/widgets/bottomNavBarC.dart';
import 'package:apex/screens/newsArtical.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:apex/objects/news.dart';
import 'package:flare_flutter/flare_actor.dart';

class NewsScreen extends StatefulWidget {
  _NewsStateScreen createState() => new _NewsStateScreen();
}

class _NewsStateScreen extends State<NewsScreen> {
  NewsList nl;
  int _state = 0;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BtmNavBar(),
        body: Container(
          height: height,
          width: width,
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
              _setup()
            ],
          ),
        ),
      ),
    );
  }

  _setup() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (_state == 0) {
      return Column(
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
      );
    } else {
      return _newsList();
    }
  }

  _newsList() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * .02,
        ),
        Container(
          width: width,
          height: height * .03,
          padding: EdgeInsets.only(left: width * .1),
          child: Text(
            "News",
            style: TextStyle(
                color: Colors.white,
                fontSize: width * .065,
                fontFamily: 'roboB',
                shadows: [Shadow(color: Colors.black38, blurRadius: 5)]),
          ),
        ),
        SizedBox(
          height: height * .05,
        ),
        Container(
          width: width,
          height: height * .8,
          child: ListView.builder(
            itemCount: nl.listNews.length,
            itemBuilder: (BuildContext context, int index) {
              News ne = nl.listNews[index];
              return _newsArticle(index, ne);
            },
          ),
        ),
      ],
    );
  }

  _newsArticle(int index, News ne) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsArtical(index: index, n: ne)));
      },
      child: Container(
        width: width * .9,
        margin: EdgeInsets.only(
            top: height * .01, right: width * .05, left: width * .05),
        padding: EdgeInsets.only(
            right: width * .02,
            left: width * .02,
            top: height * .02,
            bottom: height * .02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black45)]),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * .005,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: width * .03),
                  width: width * .082,
                  height: height * .019,
                  child: Chevron(
                    triangleHeight: width * .03,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: width * .01),
                  child: Text(
                    ne.title + "   ",
                    style:
                        TextStyle(fontSize: width * .045, fontFamily: 'roboB'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: width * .03),
                  child: Text(
                    "published by : ${ne.writer}",
                    style: TextStyle(
                        fontFamily: 'robo',
                        fontSize: width * .03,
                        color: Colors.black54),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .015,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: width * .86,
                  padding: EdgeInsets.only(left: width * .03),
                  child: Text(
                    "${ne.details}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black45,
                        fontFamily: 'robo',
                        fontSize: width * .03),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              children: <Widget>[
                Hero(
                  tag: 'NewsBanner' + index.toString(),
                  child: Container(
                    width: width * .86,
                    height: height * .3,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('${ne.img}')),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: width * .03),
                  width: width * .4,
                  child: Text(
                    "${ne.date}",
                    style: TextStyle(fontFamily: 'robo', fontSize: width * .04),
                  ),
                ),
                Container(
                  width: width * .46,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Details",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'robo',
                            fontSize: width * .04,
                            color: Colors.blue),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.blueAccent,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getData() async {
    String url = "YOUR_API_URL";
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    if (resBody['state'] == 'Success') {
      setState(() {
        nl = NewsList.fromJson(resBody);
        for (int i = 0; i < nl.listNews.length; i++) {
          nl.listNews[i].date = nl.listNews[i].convertDateToString();
        }
        _state = 1;
      });
    }
  }
}
