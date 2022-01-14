import 'package:flutter/material.dart';
import 'package:flutter_news/Widget/AppText.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter_news/Models/DateFormatter.dart';

class DetailPage extends StatelessWidget {

  DetailPage(RssItem rssItem) {
    this.rssItem = rssItem;
  }

  RssItem rssItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppText(rssItem.title,size: 30.0,color: Colors.green[800],),
            space(),
            Card(
              elevation: 10.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.network(
                    rssItem.enclosure.url,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Divider(
              height: 40.0,
              thickness: 1.0,
              color: Colors.grey,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(rssItem.author, factor: 1.3, color: Colors.green[300],),
                AppText(hourFormatter(rssItem.pubDate), factor: 1.5,color: Colors.green,)
              ],
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: AppText(
                rssItem.description,
                factor: 2.0,
                textAlign: TextAlign.justify
              )
            )

          ],
        ),
      ),
    );
  }

  Padding space() {
    return Padding(padding: EdgeInsets.only(top: 20.0));
  }

}