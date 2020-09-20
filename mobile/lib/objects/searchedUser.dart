
class SearchUser {
  String aid;

  String name;
  String platform;
  String avatar;
  String legend;
  String level;
  String kills;

  SearchUser(
      {this.aid,
      this.name,
      this.platform,
      this.avatar,
      this.legend,
      this.level,
      this.kills});

  factory SearchUser.fromJson(Map<String, dynamic> parsedJson) {
    return SearchUser(
      aid: parsedJson['id'],
      name: parsedJson['name'],
      platform: parsedJson['platform'],
      avatar: parsedJson['avatar'],
      level: parsedJson['level'],
      kills: parsedJson['kills'],
    );
  }
}

class AllSearchedUser {
  final List<SearchUser> users;
  AllSearchedUser({this.users});
  factory AllSearchedUser.fromJson(List<dynamic> parsedJson) {
    List<SearchUser> users = new List<SearchUser>();
    users = parsedJson.map((i) => SearchUser.fromJson(i)).toList();
    return new AllSearchedUser(users: users);
  }
}

