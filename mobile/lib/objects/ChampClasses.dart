import 'package:flutter/material.dart';

class Ability {
  String type;
  String name;
  String description;
  String media;

  Ability({this.type, this.description, this.media, this.name});

  factory Ability.fromJson(Map<String, dynamic> parsedJson) {
    return Ability(
        type: parsedJson['type'],
        name: parsedJson['name'],
        description: parsedJson['description'],
        media: parsedJson['media']);
  }
}

class Champ {
  String id;
  String name;
  String motto;
  String type;
  String bio;
  String realName;
  String age;
  final List<Ability> abs;
  String movie;
  Color champColor;
  String cost;
  String gender;

  Champ(
      {this.id,
      this.name,
      this.motto,
      this.type,
      this.bio,
      this.realName,
      this.age,
      this.abs,
      this.movie,
      this.champColor,
      this.cost,
      this.gender});

  factory Champ.fromJson(Map<String, dynamic> parsedJson) {
    List<Ability> abss = new List<Ability>();
    var list = parsedJson['abilities'] as List;
    abss = list.map((i) => Ability.fromJson(i)).toList();
    return Champ(
      id: parsedJson['_id'],
      name: parsedJson['name'],
      motto: parsedJson['motto'],
      type: parsedJson['type'],
      bio: parsedJson['bio'],
      realName: parsedJson['realName'],
      age: parsedJson['age'],
      movie: parsedJson['media']['movie'],
      abs: abss,
    );
  }
  void setColors() {
    switch (this.name.toUpperCase()) {
      case "WRAITH":
        this.champColor = Color(0xFF6F2DBD);
        break;
      case "PATHFINDER":
        this.champColor = Color(0xFF58A4B0);
        break;
      case "BANGALORE":
        this.champColor = Color(0xFFE5B25D);
        break;
      case "GIBRALTAR":
        this.champColor = Color(0xFFEA7317);
        break;
      case "CAUSTIC":
        this.champColor = Color(0xFFC3C49E);
        break;
      case "BLOODHOUND":
        this.champColor = Color(0xFFB57F50);
        break;
      case "MIRAGE":
        this.champColor = Color(0xFFFBB13C);
        break;
      case "LIFELINE":
        this.champColor = Color(0xFF7CC6FE);
        break;
      case "OCTANE":
        this.champColor = Color(0xFF84A98C);
        break;
      case "WATTSON":
        this.champColor = Color(0xFF5c788f);
        break;
      case "CRYPTO":
        this.champColor = Color(0xFFcce34b);
        break;

      default:
        this.champColor = Color(0xFFd59de3);
    }
  }

  void setCost() {
    switch (this.name.toUpperCase()) {
      case "CAUSTIC":
        this.cost = "12000";
        break;
      case "MIRAGE":
        this.cost = "12000";
        break;
      case "OCTANE":
        this.cost = "12000";
        break;
      case "WATTSON":
        this.cost = "12000";
        break;
      case "CRYPTO":
        this.cost = "12000";
        break;
      default:
        this.cost = "Free";
    }
  }

  void setGender() {
    switch (this.name.toUpperCase()) {
      case "WRAITH":
        this.gender = "FEMALE";
        break;
      case "PATHFINDER":
        this.gender = "UNKNOWN";
        break;
      case "BANGALORE":
        this.gender = "FEMALE";
        break;
      case "GIBRALTAR":
        this.gender = "MALE";
        break;
      case "CAUSTIC":
        this.gender = "MALE";
        break;
      case "BLOODHOUND":
        this.gender = "FEMALE";
        break;
      case "MIRAGE":
        this.gender = "MALE";
        break;
      case "LIFELINE":
        this.gender = "FEMALE";
        break;
      case "OCTANE":
        this.gender = "MALE";
        break;
      case "WATTSON":
        this.gender = "FEMALE";
        break;
      case "CRYPTO":
        this.gender = "MALE";
        break;
      default:
        this.gender = "UNKNOWN";
    }
  }
}

class ChampsList {
  final List<Champ> champs;
  ChampsList({this.champs});
  factory ChampsList.fromJson(List<dynamic> parsedJson) {
    List<Champ> champs = new List<Champ>();
    champs = parsedJson.map((i) => Champ.fromJson(i)).toList();
    return new ChampsList(champs: champs);
  }
}
