import 'package:flutter/material.dart';
const Color _mariner = Color(0xFF3B5F8F);
const Color _mediumPurple = Color(0xFF8266D4);
const Color _tomato = Color(0xFFF95B57);
const Color _mySin = Color(0xFFF3A646);

const String _kGalleryAssetsPackage = 'characters';

class Section {
  int id;

  String name;
  String realName;
  String reference;
  String gender;
  String age;

  String bio;

  String activeName;
  String activeDetails;
  String activeImg;

  String passiveName;
  String passiveDetails;
  String passiveImg;

  String ultName;
  String ultDetails;
  String ultImg;

  String img;
  Section(
      {this.id,
      this.name,
      this.realName,
      this.reference,
      this.gender,
      this.age,
      this.bio,
      this.activeName,
      this.activeDetails,
      this.activeImg,
      this.passiveName,
      this.passiveDetails,
      this.passiveImg,
      this.ultName,
      this.ultDetails,
      this.ultImg,
      this.img});

  factory Section.fromJson(Map<String, dynamic> parsedJson) {
    return Section(
      id: int.parse(parsedJson['id']),
      name: parsedJson['name'],
      realName: parsedJson['realName'],
      reference: parsedJson['reference'],
      gender: parsedJson['gender'],
      age: parsedJson['age'],
      bio: parsedJson['bio'],
      activeName: parsedJson['activeName'],
      activeDetails: parsedJson['activeDetails'],
      activeImg: parsedJson['activeImg'],
      passiveName: parsedJson['passiveName'],
      passiveDetails: parsedJson['passiveDetails'],
      passiveImg: parsedJson['passiveImg'],
      ultName: parsedJson['ultName'],
      ultDetails: parsedJson['ultDetails'],
      ultImg: parsedJson['ultImg'],
      img: parsedJson['img']
    );
  }
}

class AllSections {
  final List<Section> champs;
  AllSections({this.champs});
  factory AllSections.fromJson(List<dynamic> parsedJson) {
    List<Section> champs = new List<Section>();
    champs = parsedJson.map((i) => Section.fromJson(i)).toList();
    return new AllSections(champs: champs);
  }
}
