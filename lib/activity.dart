import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:init_app/feedentry.dart';

class Activity extends StatefulWidget {
  Map<String, dynamic> livefeed;
  String currentusername;
  String currentskill;
  final String currentmobileno;
  final Map<String, dynamic> userlist;

  Activity(this.currentusername, this.currentskill, this.currentmobileno,
      this.userlist);

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
    http
        .get('https://workfeed-715b8.firebaseio.com/feed.json')
        .then((http.Response response) {
      setState(() {
        widget.livefeed = json.decode(response.body);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Column(
          children: <Widget>[
            widget.livefeed != null
                ? activity_feed(widget.livefeed)
                : Center(
                    child: Container(
                        height: 30.0,
                        width: 30.0,
                        child: CircularProgressIndicator())),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return FeedEntry(
                              widget.currentusername,
                              widget.currentskill,
                              widget.currentmobileno,
                              widget.userlist);
                        },
                      ),
                    );
                  },
                  backgroundColor: Color.fromRGBO(81, 175, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget activity_feed(Map<String, dynamic> livefeed) {
  return Expanded(
    child: ListView.builder(
        itemCount: livefeed.length,
        itemBuilder: (BuildContext context, int index) {
          List<String> keys = livefeed.keys.toList();
          return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage(
                    'images/sketch.jpg',
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 2.0,
                    ),
                  ),
                  Expanded(
                      flex: 10,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  livefeed[keys[livefeed.length - index - 1]]
                                          ['username']
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Impact',
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  livefeed[keys[livefeed.length - index - 1]]
                                          ['skill']
                                      .toString(),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'TARGET',
                                  style: TextStyle(
                                      fontFamily: 'Impact',
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            isThreeLine: true,
                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.exit_to_app),
                                Text('  ' +
                                    livefeed[keys[livefeed.length - index - 1]]
                                            ['target']
                                        .toString()),
                              ],
                            ),
                            contentPadding: EdgeInsets.all(20.0),
                            leading: Icon(
                              Icons.access_time,
                            ),
                          ),
                        ],
                      )),
                ],
              ));
        }),
  );
}
