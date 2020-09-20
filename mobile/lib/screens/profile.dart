import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apex/widgets/bottomNavBarC.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apex/screens/userProfile.dart';
import 'package:apex/objects/userDetails.dart';
import 'dart:async';

class Profile extends StatefulWidget {
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<SharedPreferences> _serial = SharedPreferences.getInstance();

  TextEditingController _idController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _mailController = new TextEditingController();
  TextEditingController _ignController = new TextEditingController();
  UserList ul;

  int _setDataState = 0;
  int _updateState = 0;
  int _selected = 1;
  @override
  void initState() {
    _getData();
    _searchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BtmNavBar(),
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          height: height,
          width: width,

          child: ListView(
            children: <Widget>[
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * .05,
                width: width,
                padding: EdgeInsets.only(right: width * .05),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      _disconnect();
                    },
                    child: Icon(Icons.power_settings_new)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width * .8,
                    height: width * .35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.grey)
                            ],
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/default-user.png"),
                            radius: height * .070,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: height * .05,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 1;
                          _searchData();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: height * .001, left: 2, right: 2),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (_selected == 1)
                                        ? Colors.orange
                                        : Colors.transparent,
                                    width: 3))),
                        child: Center(
                          child: Text(
                            "Linked Account",
                            style: TextStyle(
                                fontFamily: 'teko', fontSize: width * .05),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width * .05,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 2;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: height * .001, left: 2, right: 2),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (_selected == 2)
                                        ? Colors.orange
                                        : Colors.transparent,
                                    width: 3))),
                        child: Center(
                          child: Text(
                            "Update Inofs.",
                            style: TextStyle(
                                fontFamily: 'teko', fontSize: width * .05),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: _setup(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _setup() {
    if (_selected == 1) {
      print(_selected);
      return _seachInfo();
    } else {
      return _updateInfos();
    }
  }

  _seachInfo() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (_setDataState == 1) {
      return Container(
          padding: EdgeInsets.only(top: height * .07),
          height: height * .52,
          child: ListView.builder(
              itemCount: ul.resultTotals,
              itemBuilder: (BuildContext ctxt, int index) =>
                  _item(ul.userList[index])));
    } else if (_setDataState == 2) {
      return Container(
        width: width,
        height: height * .52,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "(づ｡◕‿‿◕｡)づ",
                style: TextStyle(color: Colors.grey, fontSize: 50.0),
              ),
              Text("Please check the text spelling",
                  style: TextStyle(color: Colors.grey, fontSize: 20.0)),
              SizedBox(
                height: height * .02,
              ),
              Text(
                  "Profile IGN must match your In Game Name to find linked Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0))
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: height * .52,
        width: width,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _item(User user) {
    // width = 0.95
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserProfile(aid: user.aid)));
      },
      child: Container(
        //margin: EdgeInsets.only(bottom: height * .02),
        margin: EdgeInsets.only(
            top: height * .015, right: width * .025, left: width * .025),
        height: height * .13,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            /* User avatar */
            Container(
              width: width * .3,
              decoration: BoxDecoration(
                  //color:Colors.red
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 5.0, color: Colors.grey)
                      ],
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                      radius: height * .040,
                    ),
                  )
                ],
              ),
            ),
            /* End user Avatar */
            Container(
              width: width * .50,
              padding: EdgeInsets.only(
                  bottom: height * .003, top: height * .003, left: width * .02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          user.name,
                          style: TextStyle(fontFamily: 'Robo', fontSize: 26.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Platform : " + user.platform,
                        style: TextStyle(
                            fontFamily: 'Robo',
                            fontSize: 16.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Level : " + user.level,
                        style: TextStyle(
                            fontFamily: 'Robo',
                            fontSize: 14.0,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                width: width * .15,
                //color: Colors.red,
                padding: EdgeInsets.only(),
                child: Center(
                    child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 50,
                  color: Colors.grey,
                ))),
          ],
        ),
      ),
    );
  }

  _updateInfos() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: width * .1,
        right: width * .1,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: height * .04),
          Row(
            children: <Widget>[
              Container(
                width: width * .8,
                child: TextField(
                  decoration: new InputDecoration(
                    labelText: 'Full Name',
                  ),
                  enabled: true,
                  controller: _nameController,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: width * .8,
                child: TextField(
                  decoration: new InputDecoration(
                    labelText: 'E-mail',
                  ),
                  enabled: true,
                  controller: _mailController,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: width * .8,
                child: TextField(
                  decoration: new InputDecoration(
                    labelText: 'IGN',
                  ),
                  enabled: true,
                  controller: _ignController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _updateState = 1;
                  });
                  updateData();
                },
                child: Container(
                  width: (_updateState == 0) ? width * .7 : width * .2,
                  margin: EdgeInsets.only(top: height * .05),
                  padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: width * .05,
                      right: width * .05),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                          Color(0xFF8C30F6),
                          Color(0xFF8C30F6),
                          Color(0xFF8C30F6),
                          Color(0xFF8C30F6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  child: (_updateState == 0) /**TO-DO */
                      ? Center(
                          child: Text(
                          "Update",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * .04),
                        ))
                      : CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future _getData() async {
    final SharedPreferences prefs = await _serial;
    if (prefs.getString("IGN") == null) {
      print("unset ign");
    }
    setState(() {
      _idController.text = prefs.getString("id");
      _nameController.text = prefs.getString("username");
      _mailController.text = prefs.getString("email");
      if (prefs.getString("IGN") == null) {
        _ignController.text = "Unset";
      } else {
        _ignController.text = prefs.getString("IGN");
      }
    });
  }

  Future<void> _disconnect() async {
    final SharedPreferences prefs = await _serial;
    prefs.clear();
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/firstScreen', (Route<dynamic> route) => false);
  }

  Future<void> updateData() async {
    final SharedPreferences prefs = await _serial;
    print("we are here");

    String uid = prefs.getString('id');
    String name = _nameController.text;
    String email = _mailController.text;
    String ign = _ignController.text;

    String url = "YOUR_API_URL" +
        uid +
        "&name=" +
        name +
        "&email=" +
        email +
        "&IGN=" +
        ign;
    print(url);
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var resBody = json.decode(res.body);
      String state = resBody["state"];
      print("state:" + state);
      if (state == "Success") {
        prefs.setString("username", resBody['userInfo']['username']);
        prefs.setString("id", resBody['userInfo']['id']);
        prefs.setString("email", resBody['userInfo']['email']);
        prefs.setString("IGN", resBody['userInfo']['IGN']);

        _nameController.text = resBody['userInfo']['username'];
        _mailController.text = resBody['userInfo']['email'];
        _ignController.text = resBody['userInfo']['IGN'];
      }
      _updateState = 0;
    });
  }

  Future<Null> _searchData() async {
    final SharedPreferences prefs = await _serial;
    int resNum = 0;
    String user = "unset";
    if (prefs.getString("IGN") == null) {
      user = 'unset';
    } else {
      user = prefs.getString('IGN');
    }
    String platform = 'pc';

    String url = "https://apextab.com/api/search.php?platform=" +
        platform +
        "&search=" +
        user;

    print(
        "/******************************************************************************/ " +
            url);
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    print(resBody['totalresults']);
    //print("ul : "+ ul.userList[0].name);
    setState(() {
      resNum = resBody['totalresults'];
    });
    if (resNum == 0) {
      _setDataState = 2;
    } else {
      setState(() {
        ul = new UserList.fromJson(resBody);
      });
      _setDataState = 1;
    }
  }
}
