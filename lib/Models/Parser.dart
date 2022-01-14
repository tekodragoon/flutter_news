import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';

class Parser {

  final url = 'https://www.francetvinfo.fr/titres.rss';

  Future loadRSS() async {
    final respond = await get(url);
    if(respond.statusCode == 200) {
      final rssFeed = RssFeed.parse(respond.body);
      return rssFeed;
    } else {
      print('error getting url : ${respond.statusCode}');
    }
  }

}