class User {
  String aid;
  String name;
  String platform;
  String avatar;
  String level;

  User({this.aid, this.name, this.platform, this.avatar, this.level});
  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        aid: parsedJson["aid"],
        name: parsedJson["name"],
        platform: parsedJson["platform"],
        avatar: parsedJson["avatar"],
        level: parsedJson["level"]);
  }
}

class UserList {
  int resultTotals;
  final List<User> userList;
  UserList({this.resultTotals, this.userList});

  factory UserList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson["results"] as List;
    List<User> aux = list.map((i) => User.fromJson(i)).toList();
    return UserList(
      resultTotals: parsedJson["totalresults"],
      userList: aux
      );
  }
}
