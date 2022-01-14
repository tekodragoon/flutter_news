import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter_news/Widget/AppText.dart';
import 'package:flutter_news/Models/DateFormatter.dart';
import 'package:flutter_news/Widget/DetailPage.dart';

Widget listView(RssFeed rssFeed) {
  return ListView.builder(
    itemCount: rssFeed.items.length,
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
            height: 275.0,
            color: Colors.green[100],
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 7.0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(dateFormatter(actualItem.pubDate), factor: 1.3,color: Colors.teal,),
                        AppText(hourFormatter(actualItem.pubDate), factor: 1.2, color: Colors.green[900],)
                      ],
                    ),
                    Divider(
                      color: Colors.lightGreen[300],
                      height: 10.0,
                      thickness: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.width * 0.4,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Image.network(
                                actualItem.enclosure.url,
                                fit: BoxFit.fitHeight,
                              )
                          ),
                          VerticalDivider(
                            width: 10.0,
                            thickness: 1.0,
                            indent: 10.0,
                            endIndent: 10.0,
                            color: Colors.lightGreen[300],
                          ),
                          Expanded(
                              child: AppText(actualItem.title, textAlign: TextAlign.start,
                                factor: 1.4, color: Colors.green[900],)
                          )
                        ],
                      ),
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