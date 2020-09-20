import 'package:flutter/material.dart';
import 'package:apex/objects/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArtical extends StatefulWidget {
  NewsArtical({Key key, @required this.index, @required this.n})
      : super(key: key);
  final int index;
  final News n;
  _NewsArticalState createState() => new _NewsArticalState(index, n);
}

class _NewsArticalState extends State<NewsArtical> {
  _NewsArticalState(this.index, this.n);
  final int index;
  final News n;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: height,
        width: width,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: 'NewsBanner' + index.toString(),
                  child: Container(
                    height: height * .3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('${n.img}'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  //height: height * .1,
                  width: width,
                  padding: EdgeInsets.only(left: width * .01),
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
                              color: Colors.white,
                              size: width * .07,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              height: height * .65,
              padding: EdgeInsets.only(left: width * .075, right: width * .075),
              width: width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "${n.title}",
                          style: TextStyle(
                              fontSize: width * .06, fontFamily: 'roboB'),
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
                          width: width * .45,
                          child: Text(
                            "Author : ${n.writer}",
                            style: TextStyle(
                                fontFamily: 'robo',
                                fontSize: width * .035,
                                color: Colors.black45),
                          )),
                      Container(
                        width: width * .4,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${n.date}",
                          style: TextStyle(
                              fontFamily: 'robo',
                              fontSize: width * .035,
                              color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    width: width * .85,
                    child: Text(
                      n.details,
                      style: TextStyle(fontSize: width * .04),
                    ),
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _launchURL(n.url);
                        },
                        child: Container(
                            width: width * .25,
                            height: height * .06,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue),
                            child: Center(
                              child: Text(
                                "Check",
                                style: TextStyle(
                                    fontSize: width * .05,
                                    color: Colors.white,
                                    fontFamily: 'roboB'),
                              ),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .05,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
