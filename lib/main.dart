import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';

import './page2.dart';
import './page3.dart';
import './page4.dart';

void main() {
  //debugPaintSizeEnabled = true ;
  return runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/page1.jpg'),
                    fit: BoxFit.fitHeight),
              ),
            ),
            Container(
              color: Color.fromRGBO(255, 255, 255, 0.19),
            ),
            Container(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  'LETS BE PRODUCTIVE TODAY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Impact',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () {},
                    constraints:
                        BoxConstraints.tightFor(height: 10.0, width: 10.0),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                  ),
                  Page2call(),
                  Page3call(),
                  Page4call(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Page2call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      onPressed: () {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Page2();
            },
          ),
        );
      },
      constraints: BoxConstraints.tightFor(height: 10.0, width: 10.0),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}

class Page3call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      onPressed: () {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Page3();
            },
          ),
        );
      },
      constraints: BoxConstraints.tightFor(height: 10.0, width: 10.0),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}


class Page4call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      onPressed: () {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Page4();
            },
          ),
        );
      },
      constraints: BoxConstraints.tightFor(height: 10.0, width: 10.0),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}