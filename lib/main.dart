import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './PAGES/deck.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/logo.png'),
              height: 200.0,
              width: 500.0,
              alignment: Alignment(0.0, 0.0),
            ),
            Container(
              margin: EdgeInsets.all(7.0),
              child: Text(
                'WELCOME TO',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Text(
              'INIT',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40.0,
              ),
            ),
           Button() 
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Deck();
                }));
              },
              child: Text('LET\'S GO'),
            );
  }
}