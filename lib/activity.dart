import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Activity extends StatefulWidget {
  final String acusername;
  final String acskill;
  final String acmobileno;
  Map<String, dynamic> livefeed;

  Activity(this.acusername, this.acskill, this.acmobileno);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ActivityState();
  }
}

class ActivityState extends State<Activity> {
  @override
  void initState() {
    // TODO: implement initState
    Map<String, dynamic> feedentry = {
      'username': widget.acusername,
      'skill': widget.acskill,
      'target': 'Just Entered The Lab.'
    };
    http.post(
      'https://workfeed-715b8.firebaseio.com/feed.json',
      body: json.encode(feedentry),
    );

    http
        .get('https://workfeed-715b8.firebaseio.com/feed.json')
        .then((http.Response response) {
      widget.livefeed = json.decode(response.body);
      print(widget.livefeed);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(itemCount: livefeed.len,),
            )
          ],
        ),
        Container(
            width: 400.0,
            padding: EdgeInsets.all(30.0),
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 72.0,
                  width: 72.0,
                  child: FloatingActionButton(
                    child: Icon(Icons.edit),
                    elevation: 20.0,
                    onPressed: () {},
                    backgroundColor: Color.fromRGBO(81, 175, 255, 1),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
