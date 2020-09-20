class News {
  String id;
  String title;
  String details;
  String date;
  String writer;
  String img;
  String url;

  News(
      {this.id,
      this.title,
      this.details,
      this.date,
      this.writer,
      this.img,
      this.url});
  String convertDateToString() {
    var parsedDate = DateTime.parse(date);
    DateTime tm =
        new DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
    //return tm.toIso8601String();
    DateTime today = new DateTime.now();
    Duration oneDay = new Duration(days: 1);
    Duration twoDay = new Duration(days: 2);
    Duration oneWeek = new Duration(days: 7);
    String month;
    switch (tm.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Apr";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "Aug";
        break;
      case 9:
        month = "Sept";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
        break;
    }

    Duration difference = today.difference(tm);
    String dateS;
    if (difference.compareTo(oneDay) < 1) {
      dateS = "Today";

      return '$dateS, ${tm.day} $month ${tm.year}';
    } else if (difference.compareTo(twoDay) < 1) {
      dateS = "Yesterday";
      dateS = "$dateS, ${tm.day} $month ${tm.year}";
      return dateS;
    } else {
      switch (tm.weekday) {
        case 1:
          dateS = "Mon";
          break;
        case 2:
          dateS = "Tue";
          break;
        case 3:
          dateS = "Wed";
          break;
        case 4:
          dateS = "Thu";
          break;
        case 5:
          dateS = "Fri";
          break;
        case 6:
          dateS = "Sat";
          break;
        case 7:
          dateS = "Sun";
          break;
      }
      return '$dateS, ${parsedDate.day} $month ${tm.year}';
    }
  }

  factory News.fromJson(Map<String, dynamic> parsedJson) {
    return News(
        id: parsedJson['id'],
        title: parsedJson['title'],
        date: parsedJson['date'],
        details: parsedJson['details'],
        img: parsedJson['img'],
        writer: parsedJson['writer'],
        url: parsedJson['url']);
  }
}

class NewsList {
  final List<News> listNews;
  NewsList({this.listNews});

  factory NewsList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['resultSet'] as List;
    List<News> l = list.map((i) => News.fromJson(i)).toList();
    return NewsList(listNews: l);
  }
}
