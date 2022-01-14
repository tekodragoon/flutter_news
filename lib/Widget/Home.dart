import 'package:flutter/material.dart';
import 'package:flutter_news/Widget/ListView.dart';
import 'package:flutter_news/Widget/GridView.dart';
import 'package:flutter_news/Widget/LoadWiew.dart';
import 'package:flutter_news/Models/Parser.dart';
import 'package:webfeed/webfeed.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed rssFeed;

  @override
  void initState() {
    super.initState();
    parseRss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    rssFeed = null;
                    parseRss();
                  });
                })
          ],
        ),
        body: body()
    );
  }

  Widget body() {
    if(rssFeed == null) {
      return LoadView();
    }
    else {
      Orientation deviceOrient = MediaQuery.of(context).orientation;
      if(deviceOrient == Orientation.portrait) {
        return listView(rssFeed);
      } else {
        return gridView(rssFeed);
      }
    }
  }

  Future<Null> parseRss() async {
    RssFeed received = await Parser().loadRSS();
    if(received != null) {
      setState(() {
        rssFeed = received;
        /*
        print('nombre d\'info ${rssFeed.items.length}');
        print('source: ${rssFeed.author}');
        rssFeed.items.forEach((element) {
          print(element.title);
          print(element.pubDate);
          print(element.author);
          print(element.categories);
        });
        */
      });
    }
  }

}
