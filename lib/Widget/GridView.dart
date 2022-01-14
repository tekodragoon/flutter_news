import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter_news/Widget/AppText.dart';
import 'package:flutter_news/Models/DateFormatter.dart';
import 'package:flutter_news/Widget/DetailPage.dart';

Widget gridView(RssFeed rssFeed) {
  return GridView.builder(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, i) {
        RssItem actualItem = rssFeed.items[i];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext ctx) {
                  return DetailPage(actualItem);
                }));
          },
          child: Container(
            color: Colors.green[200],
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 7.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(dateFormatter(actualItem.pubDate), factor: 1.05, color: Colors.teal,),
                        AppText(hourFormatter(actualItem.pubDate), factor: 1.0, color: Colors.green[900],)
                      ],
                    ),
                    Divider(
                      color: Colors.lightGreen[300],
                      height: 20.0,
                      thickness: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    Expanded(
                        child: Image.network(
                          actualItem.enclosure.url,
                          fit: BoxFit.fitHeight,
                        )
                    ),
                    Divider(
                      color: Colors.lightGreen[300],
                      height: 20.0,
                      thickness: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    Expanded(
                        child: AppText(actualItem.title, textAlign: TextAlign.start,
                          factor: 1.0, color: Colors.green[900],)
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
  );
}