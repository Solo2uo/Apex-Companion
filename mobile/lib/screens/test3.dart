import 'package:flutter/material.dart';

class HeroSelect1 extends StatefulWidget {
  _HeroSelectState1 createState() => new _HeroSelectState1();
}

class _HeroSelectState1 extends State<HeroSelect1> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        print("changed state");
      });
    });
    return Scaffold(
        body: Container(
            child: PageView.builder(
      controller: controller,
      itemBuilder: (context, position) {
        if (position == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        } else if (position == currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: position % 2 == 0 ? Colors.blue : Colors.pink,
            child: Center(
              child: Text(
                "Page",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          );
        }
      },
      itemCount: 10,
    )));
  }

  Container _listViewHeros(double height, double width) {
    /*child: PageView.builder(
          controller: controller,
          itemCount: 4,
          itemBuilder: (context, position) {
            if (position == currentPageValue.floor()) {
              return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - position),
                  child: _heroPage());
            } else if (position == currentPageValue.floor() + 1) {
              return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - position),
                  child: _heroPage());
            } else {
              return _heroPage();
            }
          }),*/
  }

  _heroPage() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: height * .3, left: width * .15),
          height: height * .52,
          width: width * .7,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(spreadRadius: 2.0, color: Colors.grey, blurRadius: 15)
          ], color: Colors.orange, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          margin: EdgeInsets.only(top: height * .07, left: width * .15),
          height: height * .6,
          width: width * .7,
          decoration: BoxDecoration(
              //color: Colors.grey,
              image: DecorationImage(
                  image: AssetImage("assets/small/wraith-small.png"))),
        ),
        Container(
          margin: EdgeInsets.only(top: height * .6, left: width * .15),
          width: width * .7,
          //color: Colors.grey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Wraith",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'apex', fontSize: 36),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "PhsycoPath",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'apex', fontSize: 26),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
