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
    return Scaffold(
        backgroundColor: Color.fromRGBO(70, 192, 255, 2.0),
        appBar: AppBar(
          title: Text('WELCOME TO THE DECK'),
        ),
        body: Column(
          children: <Widget>[
            Expanded( 
              child :
              ButtonBar(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 20.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Roomstatus();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Room Status',
                      style: TextStyle(
                        fontSize: 10.2,
                        fontFamily: 'Imapact',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RaisedButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 20.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Recentactivity();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 10.2,
                        fontFamily: 'Impact',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RaisedButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 20.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Memberinfo();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Member\'s info',
                      style: TextStyle(
                        fontSize: 10.2,
                        fontFamily: 'Impact',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
