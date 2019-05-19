import 'package:flutter/material.dart';

import './roomstatus.dart';
import './memberinfo.dart';
import './recent.dart';

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
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DECK'),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'Status',icon: Icon(Icons.schedule),),
            Tab(text: 'Activity',icon: Icon(Icons.dehaze)),
            Tab(text: 'Info',icon: Icon(Icons.contacts),),
          ],),
        ),
      body: TabBarView(children: <Widget>[
                Roomstatus(),
                Recentactivity(),
                Memberinfo(),

      ],),),
      length: 3,
    );
  }
}



