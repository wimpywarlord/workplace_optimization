import 'package:flutter/material.dart';

import './roomstatus.dart';

class Deck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeckState();
  }
}

class _DeckState extends State<Deck> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('RECENT ACTIVITY'),
      ),
      body: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                      return Roomstatus();
                  }
                ),
              );
            },
            child: Text(
              'Room Status',
              style: TextStyle(fontSize: 13.0, fontFamily: 'Imapact'),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Impact',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(
              'Member\'s info',
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Impact',
              ),
            ),
          )
        ],
      ),
    );
  }
}
