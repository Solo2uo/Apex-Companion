import 'package:flutter/material.dart';
import 'package:apex/screens/splashScreen.dart';
import 'package:apex/screens/firstScreen.dart';
import 'package:apex/screens/login.dart';
import 'package:apex/screens/test.dart';
import 'package:apex/screens/news.dart';
import 'package:apex/screens/weaponsCategory.dart';
import 'package:apex/screens/searchPlayer.dart';
import 'package:apex/screens/test3.dart';
import 'package:apex/screens/test2.dart';
import 'package:apex/screens/home.dart';
import 'package:apex/screens/heroSelect.dart';
import 'package:apex/screens/profile.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new ApexCompanion());
    });
}

class ApexCompanion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Apex Companion',
      routes: <String, WidgetBuilder>{
        '/firstScreen': (BuildContext context) => new FirstScreen(),
        '/login': (BuildContext context) => new Login(),
        '/weaponsCategory': (BuildContext context) => new WeaponsCategory(),
        '/SeachPlayers': (BuildContext context) => new SearchPlayers(),
        '/reg': (BuildContext context) => new HeroSelect1(),
        '/heros': (BuildContext context) => new HeroSelect(),
        '/test4': (BuildContext context) => new WeaponsListDisplay(),
        '/homeScreen': (BuildContext context) => new HomeScreen(),
        '/home': (BuildContext context) => new HomeScreen(),
        '/profile': (BuildContext context) => new Profile(),
        '/news': (BuildContext context) => new NewsScreen(),
      },
      home: new SplashScreen(),
    );
  }
}
