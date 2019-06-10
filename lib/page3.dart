import 'package:flutter/material.dart';
import 'package:init_app/main.dart';
import 'package:init_app/page4.dart';

import './main.dart';
import './page2.dart';
import './page4.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Page4();
              },
            ),
          );
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/page3.jpg'), fit: BoxFit.cover),
                ),
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 0.19),
              ),
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'OPTIMIZE YOUR WORKPLACE EFFICIENCY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 45.0,
                        fontFamily: 'bold',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Page1call(),
                    Page2call(),
                    Page3call(),
                    Page4call(),
                  ],
                ),
              )
            ],
          ),
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

class Page1call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      onPressed: () {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Start();
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
      onPressed: () {},
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
