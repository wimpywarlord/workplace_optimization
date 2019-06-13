import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test extends StatefulWidget {
  @override
  Map<String, dynamic> livefeed;

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestState();
  }
}

class TestState extends State<Test> {
  @override
  void initState() {
    setState(() {
      http
          .get('https://workfeed-715b8.firebaseio.com/feed.json')
          .then((http.Response response) {
        widget.livefeed = json.decode(response.body);
        print(widget.livefeed);
        print(widget.livefeed.length);
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.livefeed != null
          ? widget.livefeed.toString()
          : 'some default text like loading...'),
    );
  }
}
