import 'package:flutter/material.dart';
import 'package:flutter_news/Widget/AppText.dart';

class LoadView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            'chargement en cours...',
            color: Colors.green[900],
            size: 25.0,
            style: FontStyle.italic,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.green,
            strokeWidth: 5.0,
          )
        ],
      )
    );
  }

}