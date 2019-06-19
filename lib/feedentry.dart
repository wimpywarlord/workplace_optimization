import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:init_app/activity.dart';
import 'package:init_app/apppage.dart';

class FeedEntry extends StatefulWidget {
  String currentusername;
  String currentskill;
  String localtarget = '';
  final String currentmobileno;
  final Map<String, dynamic> userlist;
  FeedEntry(this.currentusername, this.currentskill, this.currentmobileno,
      this.userlist);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FeedEntryState();
  }
}

class FeedEntryState extends State<FeedEntry> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/door.jpg'),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'ENTER YOUR PROGRESS',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'bold',
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 400.0,
                          child: TextFormField(
                            maxLength: 20,
                            onSaved: (String value) {
                              widget.localtarget = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Target',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                              ),
                            ),         
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                elevation: 20.0,
                onPressed: () {
                  _formkey.currentState.save();
                  Map<String, dynamic> localentry = {
                    'username': widget.currentusername,
                    'skill': widget.currentskill,
                    'target': widget.localtarget
                  };
                  http
                      .post('https://workfeed-715b8.firebaseio.com/feed.json',
                          body: json.encode(localentry))
                      .then((http.Response response) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AppStartPage(
                            widget.userlist,
                            widget.currentusername,
                            widget.currentskill,
                            widget.currentmobileno,
                          );
                        },
                      ),
                    );
                  });
                },
                child: Text('POST'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
