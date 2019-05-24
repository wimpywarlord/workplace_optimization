import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';

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
                    image: AssetImage('assets/page1.jpg'),
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
              child: Row(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}
