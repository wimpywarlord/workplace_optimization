import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class RoomStatus extends StatefulWidget {
  @override
  _RoomStatusState createState() => _RoomStatusState();
}

class _RoomStatusState extends State<RoomStatus> {
  Map<String, dynamic> timelist;
  @override
  void initState() {
    // TODO: implement initState

    http
        .get('https://workfeed-715b8.firebaseio.com/time.json')
        .then((http.Response response) {
      if (mounted) {
        setState(() {
          timelist = json.decode(response.body);
          //print(timelist);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return timelist != null
        ? Room_stat(timelist)
        : Center(child: Container(height: 30.0,width: 30.0,child: CircularProgressIndicator()));
  }
}

Widget Room_stat(Map<String, dynamic> timelist) {
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
            itemCount: timelist.length,
            itemBuilder: (BuildContext context, int index) {
              List<String> keys = timelist.keys.toList();
              DateTime now = DateTime.now();
              DateTime logintime = DateTime.parse(
                  timelist[keys[timelist.length - index - 1]]['time']);

              Duration diff = now.difference(logintime);
              Duration check = new Duration(hours: 1, minutes: 0, seconds: 0);
              print('*******');
              print(now);
              print(logintime);
              print(diff);
              print(check);
              print(timelist[keys[timelist.length - index - 1]]['username']);
              if (diff < check) {
                print('lol');
                return ListTile(
                  title: Text(
                    timelist[keys[timelist.length - index - 1]]['username'],
                    style: TextStyle(fontSize: 20.0, fontFamily: 'bold'),
                  ),
                  leading: RawMaterialButton(
                    constraints:
                        BoxConstraints.tightFor(height: 10.0, width: 10.0),
                    shape: CircleBorder(),
                    fillColor: Colors.lightGreen,
                  ),
                );
              } else {
                return Container();
              }
            }),
      )
    ],
  );
}
