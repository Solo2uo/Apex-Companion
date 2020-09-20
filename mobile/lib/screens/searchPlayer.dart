import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apex/objects/userDetails.dart';
import 'package:apex/screens/userProfile.dart';
import 'package:apex/widgets/bottomNavBarC.dart';

class SearchPlayers extends StatefulWidget {
  _SearchPlayersState createState() => new _SearchPlayersState();
}

class _SearchPlayersState extends State<SearchPlayers> {
  String user = "";
  String platform = "pc";
  UserList ul;

  int _state = 0;

  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool _autoFocusOcr = true;
  bool _torchOcr = false;
  bool _multipleOcr = false;
  bool _waitTapOcr = true;
  bool _showTextOcr = true;
  Size _previewOcr = const Size(400, 500);
  List<OcrText> _textsOcr = [];
  final searchText = TextEditingController();
  @override
  void initState() {
    super.initState();
    /*FlutterMobileVision.start().then((previewSizes) => setState(() {
          _previewOcr = previewSizes[_cameraOcr].first;
          //_previewOcr =const Size(400,500);
        }));*/
  }

  Widget _button() {
    if (Platform.isIOS) {
      return null;
    } else {
      return null;/*FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.camera),
        onPressed: () {
          _read();
        },
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BtmNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _button(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      
                      margin: EdgeInsets.only(
                          //top: height * .015,
                          right: width * .025,
                          left: width * .025),
                      child: Container(
                        height: height * .055,
                        width: width * .95,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 2)],
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: .5),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  platform = "pc";
                                });
                              },
                              child: Container(
                                width: width * .1,
                                color: this.platform == "pc"
                                    ? Colors.grey[300]
                                    : Colors.white,
                                child: Container(
                                  
                                  margin:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/origin.png'),
                                          fit: BoxFit.contain)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  platform = "xbl";
                                });
                              },
                              child: Container(
                                color: this.platform == "xbl"
                                    ? Colors.grey[300]
                                    : Colors.white,
                                width: width * .1,
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/xbox.png'),
                                          fit: BoxFit.contain)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  platform = "psn";
                                });
                              },
                              child: Container(
                                width: width * .1,
                                color: this.platform == "psn"
                                    ? Colors.grey[300]
                                    : Colors.white,
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/ps4.png'),
                                          fit: BoxFit.contain),
                                      border: Border(
                                          right: BorderSide(
                                              width: 1.0, color: Colors.grey))),
                                ),
                              ),
                            ),
                            Container(
                              height: height * .05,
                              width: width * .6,
                              padding: EdgeInsets.only(
                                  top: height * .012, left: width * .03),
                              child: new TextField(
                                controller: searchText,
                                decoration: new InputDecoration.collapsed(
                                    hintText: "Username"),
                                onSubmitted: (_) {
                                  print(searchText.text);
                                  _searchData();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /*RaisedButton(
                onPressed: (){
                  _searchData();
                },
              ),*/
              _bodyBuilder(height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyBuilder(double height) {
    if (_state == 2) {
      return Container(
        height: height * .6,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "(づ｡◕‿‿◕｡)づ",
                style: TextStyle(color: Colors.grey, fontSize: 50.0),
              ),
              Text("Please check the text spelling",
                  style: TextStyle(color: Colors.grey, fontSize: 20.0))
            ],
          ),
        ),
      );
    } else if (_state == 1) {
      return listUsers();
    } else {
      return Container(
        height: height * .6,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "┐(￣ヮ￣)┌",
                style: TextStyle(color: Colors.grey, fontSize: 50.0),
              ),
              Text("You must have more then 5 games",
                  style: TextStyle(color: Colors.grey, fontSize: 20.0))
            ],
          ),
        ),
      );
    }
  }

  Container listUsers() {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      /*margin: EdgeInsets.only(
                top: height * .015, right: width * .025, left: width * .025),*/
      child: ListView.builder(
          itemCount: ul.resultTotals,
          itemBuilder: (BuildContext ctxt, int index) =>
              Item(ul.userList[index])),
    );
  }

  Widget Item(User user) {
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

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        flash: _torchOcr,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        waitTap: _waitTapOcr,
        showText: _showTextOcr,
        preview: _previewOcr,
        camera: _cameraOcr,
        fps: 2.0,
      );
      print("/*****************************************************   :   " +
          texts[0].value);
      setState(() {
        searchText.text = texts[0].value;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }

    if (!mounted) return;

    setState(() => _textsOcr = texts);
  }

  Future<Null> _searchData() async {
    int resNum = 0;
    String user = searchText.text;

    String url = "https://apextab.com/api/search.php?platform=" +
        platform +
        "&search=" +
        user;
    http.Response res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    //print("ul : "+ ul.userList[0].name);
    setState(() {
      resNum = resBody['totalresults'];

      if (resNum == 0) {
        _state = 2;
      } else {
        ul = new UserList.fromJson(resBody);
        _state = 1;
      }
      print(_state);
    });
  }
}
