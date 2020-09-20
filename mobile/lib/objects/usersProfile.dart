class ChampionStates {
  String champName;
  String kills;
  String matches;
  String headshots;

  ChampionStates({this.champName, this.kills, this.headshots, this.matches});
}

class UserProfileDetails {
  String aid;
  String name;
  String platform;
  String avatar;
  String legend;
  String level;
  String kills;
  String headshots;
  String matches;
  String visits;
  String killsBloodhound;
  String killsGibraltar;
  String killsLifeline;
  String killsPathfinder;
  String killsWraith;
  String killsBangalore;
  String killsCaustic;
  String killsMirage;
  String headshotsBloodhound;
  String headshotsGibraltar;
  String headshotsLifeline;
  String headshotsPathfinder;
  String headshotsWraith;
  String headshotsBangalore;
  String headshotsCaustic;
  String headshotsMirage;
  String matchesBloodhound;
  String matchesGibraltar;
  String matchesLifeline;
  String matchesPathfinder;
  String matchesWraith;
  String matchesBangalore;
  String matchesCaustic;
  String matchesMirage;
  String globalrank;
  String utime;
  List<ChampionStates> champs;

  UserProfileDetails(
      {this.aid,
      this.name,
      this.platform,
      this.avatar,
      this.legend,
      this.level,
      this.kills,
      this.headshots,
      this.matches,
      this.visits,
      this.killsBloodhound,
      this.killsGibraltar,
      this.killsLifeline,
      this.killsPathfinder,
      this.killsWraith,
      this.killsBangalore,
      this.killsCaustic,
      this.killsMirage,
      this.headshotsBloodhound,
      this.headshotsGibraltar,
      this.headshotsLifeline,
      this.headshotsPathfinder,
      this.headshotsWraith,
      this.headshotsBangalore,
      this.headshotsCaustic,
      this.headshotsMirage,
      this.matchesBloodhound,
      this.matchesGibraltar,
      this.matchesLifeline,
      this.matchesPathfinder,
      this.matchesWraith,
      this.matchesBangalore,
      this.matchesCaustic,
      this.matchesMirage,
      this.globalrank,
      this.utime});

  void setChampList() {
    champs = new List<ChampionStates>();
    if (this.killsBangalore != "0") {
      ChampionStates ch1 = new ChampionStates(
          champName: "bangalore",
          kills: this.killsBangalore,
          matches: this.matchesBangalore,
          headshots: this.headshotsBangalore);
      champs.add(ch1);
    }
    if (this.headshotsBloodhound != "0") {
      ChampionStates ch2 = new ChampionStates(
          champName: "bloodHound",
          kills: this.killsBloodhound,
          matches: this.matchesBloodhound,
          headshots: this.headshotsBloodhound);
      champs.add(ch2);
    }
    if (this.killsCaustic != "0") {
      ChampionStates ch3 = new ChampionStates(
          champName: "caustic",
          kills: this.killsCaustic,
          matches: this.matchesCaustic,
          headshots: this.headshotsCaustic);
      champs.add(ch3);
    }
    if (this.killsGibraltar != "0") {
      ChampionStates ch4 = ChampionStates(
          champName: "gibraltar",
          kills: this.killsGibraltar,
          matches: this.matchesGibraltar,
          headshots: this.headshotsGibraltar);
      champs.add(ch4);
    }
    if (this.killsLifeline != "0") {
      ChampionStates ch5 = ChampionStates(
          champName: "lifeline",
          kills: this.killsLifeline,
          matches: this.matchesLifeline,
          headshots: this.headshotsLifeline);
      champs.add(ch5);
    }
    if (this.killsMirage != "0") {
      ChampionStates ch6 = ChampionStates(
          champName: "mirage",
          headshots: this.headshotsMirage,
          matches: this.matchesMirage,
          kills: this.killsMirage);
      champs.add(ch6);
    }
    if (this.headshotsPathfinder != "0") {
      ChampionStates ch7 = ChampionStates(
          champName: "pathFinder",
          kills: this.killsPathfinder,
          matches: this.matchesPathfinder,
          headshots: this.headshotsPathfinder);
      champs.add(ch7);
    }
    if (this.killsWraith != "0") {
      ChampionStates ch8 = ChampionStates(
          champName: "wraith",
          headshots: this.headshotsWraith,
          matches: this.matchesWraith,
          kills: this.killsWraith);
      champs.add(ch8);
    }
  }

  factory UserProfileDetails.fromJson(Map<String, dynamic> parsedJson) {
    return UserProfileDetails(
        aid: parsedJson['aid'],
        name: parsedJson['name'],
        platform: parsedJson['platform'],
        avatar: parsedJson['avatar'],
        level: parsedJson['level'],
        kills: parsedJson['kills'],
        headshots: parsedJson['headshots'],
        matches: parsedJson['matches'],
        visits: parsedJson['visits'],
        legend: parsedJson['legend'],
        killsBloodhound: parsedJson['kills_Bloodhound'],
        killsGibraltar: parsedJson['kills_Gibraltar'],
        killsLifeline: parsedJson['kills_Lifeline'],
        killsPathfinder: parsedJson['kills_Pathfinder'],
        killsWraith: parsedJson['kills_Wraith'],
        killsBangalore: parsedJson['kills_Bangalore'],
        killsCaustic: parsedJson['kills_Caustic'],
        killsMirage: parsedJson['kills_Mirage'],
        headshotsBloodhound: parsedJson['headshots_Bloodhound'],
        headshotsGibraltar: parsedJson['headshots_Gibraltar'],
        headshotsLifeline: parsedJson['headshots_Lifeline'],
        headshotsPathfinder: parsedJson['headshots_Pathfinder'],
        headshotsWraith: parsedJson['headshots_Wraith'],
        headshotsBangalore: parsedJson['headshots_Bangalore'],
        headshotsCaustic: parsedJson['headshots_Caustic'],
        headshotsMirage: parsedJson['headshots_Mirage'],
        matchesBloodhound: parsedJson['matches_Bloodhound'],
        matchesGibraltar: parsedJson['matches_Gibraltar'],
        matchesLifeline: parsedJson['matches_Lifeline'],
        matchesPathfinder: parsedJson['matches_Pathfinder'],
        matchesWraith: parsedJson['matches_Wraith'],
        matchesBangalore: parsedJson['matches_Bangalore'],
        matchesCaustic: parsedJson['matches_Caustic'],
        matchesMirage: parsedJson['matches_Mirage'],
        globalrank: parsedJson['globalrank'],
        utime: parsedJson['utime']);
  }
}

class DailyStats {
  DateTime date;
  int kills;
  int headshots;
  int matchs;
  int damage;

  DailyStats({this.kills, this.headshots, this.matchs, this.damage});
  factory DailyStats.fromJson(Map<String, dynamic> parsedJson) {
    return DailyStats(
        kills: parsedJson['kills'],
        headshots: parsedJson['headshots'],
        matchs: parsedJson['matches'],
        damage: parsedJson['damage']);
  }
}

class TopChamp {
  String name;
  double kills;
  double precent;
  String displayRank;
  TopChamp({this.name, this.kills, this.displayRank, this.precent});
}


