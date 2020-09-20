class WeaponDetails {
  String name;
  String type;
  String description;
  String ammo;
  String magSize;
  String rpm;
  Reload reload;
  Damage dmg;
  String cls;
  final List<FireMode> fireModes;
  final List<Recoil> recoils;
  final List<Attachments> attachements;

  WeaponDetails(
      {this.name,
      this.type,
      this.description,
      this.ammo,
      this.attachements,
      this.dmg,
      this.fireModes,
      this.magSize,
      this.recoils,
      this.reload,
      this.cls,
      this.rpm});
  factory WeaponDetails.fromJson(Map<String, dynamic> parsedJson) {
    List<FireMode> f = new List<FireMode>();
    var listF = parsedJson['fireModes'];
    List<String> l = new List<String>.from(listF);
    for (int i = 0; i < l.length; i++) {
      FireMode ff = new FireMode(l[i]);
      f.add(ff);
    }

    /*var listF = parsedJson['fireModes'] as List;
    f = listF.map((i) => FireMode.fromJson(i)).toList();*/

    List<Recoil> r = new List<Recoil>();

    var listR = parsedJson['recoil'];
    List<String> l2 = new List<String>.from(listR);
    for (int i = 0; i < l2.length; i++) {
      Recoil rr = new Recoil(l2[i]);
      r.add(rr);
    }

    /*var listr = parsedJson['recoil'] as List;
    r = listr.map((i) => Recoil.fromJson(i)).toList();*/

    List<Attachments> a = new List<Attachments>();

    var listA = parsedJson['attachments'];
    List<String> l3 = new List<String>.from(listA);
    for (int i = 0; i < l3.length; i++) {
      Attachments aa = new Attachments(l3[i]);
      a.add(aa);
    }
    /*var listA = parsedJson['attachments'] as List;
    a = listA.map((i) => Attachments.fromJson(i)).toList();*/

    return WeaponDetails(
      cls: parsedJson["class"],
      name: parsedJson["name"].toString(),
      type: parsedJson["type"].toString(),
      description: parsedJson['description'].toString(),
      ammo: parsedJson["ammo"].toString(),
      dmg: Damage.fromJson(parsedJson['damage']),
      magSize: parsedJson['magsize'].toString(),
      rpm: parsedJson['rpm'].toString(),
      reload: Reload.fromJson(parsedJson['reload']),
      attachements: a,
      fireModes: f,
      recoils: r,
    );
  }
}

class Reload {
  String loaded;
  String empty;

  Reload({this.loaded, this.empty});

  factory Reload.fromJson(Map<String, dynamic> parsedJson) {
    return Reload(
        loaded: parsedJson["loaded"].toString(),
        empty: parsedJson['empty'].toString());
  }
}

class Damage {
  String dpsBody;
  String dpsHead;
  String body;
  String head;
  String multiplier;
  String maxHeadShotRange;

  Damage(
      {this.body,
      this.dpsBody,
      this.maxHeadShotRange,
      this.dpsHead,
      this.head,
      this.multiplier});

  factory Damage.fromJson(Map<String, dynamic> parsedJson) {
    return Damage(
        body: parsedJson["body"].toString(),
        head: parsedJson["head"].toString(),
        dpsBody: parsedJson["dps"]["body"].toString(),
        dpsHead: parsedJson["dps"]["head"].toString(),
        maxHeadShotRange: parsedJson["maxHeadshotRange"].toString(),
        multiplier: parsedJson['multiplier'].toString());
  }
}

class FireMode {
  String type;
  FireMode(String t) {
    this.type = t;
  }
}

class Attachments {
  String type;
  String details;
  //Attachments({this.type});
  Attachments(String t) {
    this.type = t;
  }
  /*factory Attachments.fromJson(Map<String, dynamic> parsedJson) {
    return Attachments(type: parsedJson["type"]);
  }*/
}

class Recoil {
  String type;
  //Recoil({this.type});
  Recoil(String t) {
    this.type = t;
  }
  /*factory Recoil.fromJson(Map<String, dynamic> parsedJson) {
    return Recoil(type: parsedJson["type"]);
  }*/
}

class WeaponsList {
  final List<WeaponDetails> weapons;
  List<WeaponDetails> pistols = new List<WeaponDetails>();
  List<WeaponDetails> shotguns = new List<WeaponDetails>();
  List<WeaponDetails> ars = new List<WeaponDetails>();
  List<WeaponDetails> lmgs = new List<WeaponDetails>();
  List<WeaponDetails> smgs = new List<WeaponDetails>();
  List<WeaponDetails> snipers = new List<WeaponDetails>();

  WeaponsList({this.weapons});

  factory WeaponsList.fromJson(List<dynamic> parsedJson) {
    List<WeaponDetails> wmps = new List<WeaponDetails>();
    wmps = parsedJson.map((i) => WeaponDetails.fromJson(i)).toList();
    return new WeaponsList(weapons: wmps);
  }
  void setLists() {
    for (int i = 0; i < weapons.length; i++) {
      for (int j = 0; j < weapons[i].attachements.length; j++) {
        switch (weapons[i].attachements[j].type) {
          case "Barrel":
            if (weapons[i].cls == "Shotgun") {
              weapons[i].attachements[j].details = "Upgrade the fire rate.";
              weapons[i].attachements[j].type = "Bolt";
            } else {
              weapons[i].attachements[j].details = "recoil reduction.";
            }
            break;
          case "Hop-Up":
            weapons[i].attachements[j].details =
                "Selectfire Receiver: Enables fire select for compatible weapons.\n\nTurbocharger:Reduces autofire spin-up time for compatible weapons.\n\nPrecision Choke:Reduces projectile spread for compatible weapons.";
            break;
          case "Optic":
            weapons[i].attachements[j].details = "Change ADS vision type";
            break;
          case "Mag":
            weapons[i].attachements[j].details =
                "Low to high ammo capacity with faster reload duration.";
            break;
          case "Stock":
            weapons[i].attachements[j].details =
                "Improves handling and reduces aim drift.";
            break;
          default:
        }
      }

      switch (weapons[i].cls) {
        case "Pistol":
          //print("im in the pistol part" + weapons[i].cls);
          pistols.add(weapons[i]);
          break;
        case "Shotgun":
          shotguns.add(weapons[i]);
          break;
        case "SR":
          snipers.add(weapons[i]);
          break;
        case "LMG":
          //print("im in the pistol part" + weapons[i].cls);
          lmgs.add(weapons[i]);
          break;
        case "SMG":
          smgs.add(weapons[i]);
          break;
        case "AR":
          ars.add(weapons[i]);
          break;
        default:
      }
    }
  }
}
