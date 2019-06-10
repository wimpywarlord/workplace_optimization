import 'package:flutter/material.dart';

class AppStartPage extends StatefulWidget {
  @override
  final String currentusername;
  final String currentskill;
  final String currentmobileno;

  AppStartPage(this.currentusername, this.currentskill, this.currentmobileno);

  State createState() {
    return AppStartPageState();
  }
}

class AppStartPageState extends State<AppStartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Text(widget.currentusername),
            Text(widget.currentskill),
            Text(widget.currentmobileno),
          ],
        ),
      ),
    );
  }
}
