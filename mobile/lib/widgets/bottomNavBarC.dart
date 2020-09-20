import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BtmNavBar extends StatefulWidget {
  _BtmNavBar createState() => new _BtmNavBar();
}

class _BtmNavBar extends State<BtmNavBar> {
  Future<SharedPreferences> _serial = SharedPreferences.getInstance();
  int _logState = 0;
  @override
  void initState() {
    _checkLoggin();
    super.initState();
  }

  _checkLoggin() async {
    final SharedPreferences prefs = await _serial;
    if (prefs.getString("id") != null) {
      setState(() {
        _logState = 1;
      });
    } else {
      setState(() {
        _logState = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .06,
      child: BottomAppBar(
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.only(
              left: width * .05,
              right: width * .05,
              top: height * .01,
              bottom: height * .01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/news', (Route<dynamic> route) => false);
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: width * .03, right: width * .04),
                    child: Image(
                      image: AssetImage("assets/icons/news.png"),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  if (_logState == 1) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/profile', (Route<dynamic> route) => false);
                  } else {
                    Navigator.of(context).pushNamed("/login");
                  }
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: width * .03, right: width * .04),
                    child: Image(
                      image: AssetImage("assets/icons/user.png"),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/SeachPlayers', (Route<dynamic> route) => false);
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: width * .03, right: width * .04),
                    child: Image(
                      image: AssetImage("assets/icons/search.png"),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/heros', (Route<dynamic> route) => false);
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: width * .03, right: width * .04),
                    child: Image(
                      image: AssetImage("assets/icons/champs.png"),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/weaponsCategory', (Route<dynamic> route) => false);
                },
                child: Container(
                    padding:
                        EdgeInsets.only(left: width * .03, right: width * .04),
                    child: Image(
                      image: AssetImage("assets/icons/weapons.png"),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
