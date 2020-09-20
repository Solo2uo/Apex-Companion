import 'package:flutter/material.dart';
import 'package:apex/widgets/bottomNavBarC.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BtmNavBar(),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: height * .4,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: height * .32,
                      width: width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/bg-sts.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * .2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: height * .2,
                            width: height * .2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 5)
                                ]),
                            child: Center(
                              child: Image(
                                image: AssetImage("assets/icons/champs.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: width * .05),
                    child: Text(
                      "Features",
                      style: TextStyle(
                          fontSize: width * .07,
                          color: Colors.grey,
                          fontFamily: 'teko'),
                    ),
                  )
                ],
              ),
              Container(
                height: height * .55,
                width: width,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: height * .05),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: width * .05),
                            width: width * .425,
                            padding: EdgeInsets.only(
                                top: height * .02,
                                bottom: height * .02,
                                left: width * .02,
                                right: width * .02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 5)
                                ],
                                color: Colors.white),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          "assets/icons/weapons.png"),
                                    )
                                  ],
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Cheack weapons",
                                        style: TextStyle(
                                            fontFamily: 'teko',
                                            color: Colors.grey,
                                            fontSize: width * .04))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * .05,
                          ),
                          Container(
                            //margin: EdgeInsets.only(left: width * .05),
                            width: width * .425,
                            padding: EdgeInsets.only(
                                top: height * .02,
                                bottom: height * .02,
                                left: width * .02,
                                right: width * .02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 5)
                                ],
                                color: Colors.white),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Image(
                                      image:
                                          AssetImage("assets/icons/champs.png"),
                                      height: width * .12,
                                    )
                                  ],
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Check Champions",
                                        style: TextStyle(
                                            fontFamily: 'teko',
                                            color: Colors.grey,
                                            fontSize: width * .04))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: width * .05),
                          width: width * .425,
                          padding: EdgeInsets.only(
                              top: height * .02,
                              bottom: height * .02,
                              left: width * .02,
                              right: width * .02),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5)
                              ],
                              color: Colors.white),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(Icons.search, size: width * .12),
                                ],
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Search Players Stats",
                                      style: TextStyle(
                                          fontFamily: 'teko',
                                          color: Colors.grey,
                                          fontSize: width * .04))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: width * .05,
                        ),
                        Container(
                          //margin: EdgeInsets.only(left: width * .05),
                          width: width * .425,
                          padding: EdgeInsets.only(
                              top: height * .02,
                              bottom: height * .02,
                              left: width * .02,
                              right: width * .02),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5)
                              ],
                              color: Colors.white),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("assets/icons/user.png"),
                                    height: width * .12,
                                  )
                                ],
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Update your profile",
                                      style: TextStyle(
                                          fontFamily: 'teko',
                                          color: Colors.grey,
                                          fontSize: width * .04))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
