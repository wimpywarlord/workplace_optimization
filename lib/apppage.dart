import 'package:flutter/material.dart';
import 'package:init_app/roomstatus.dart';


import './members.dart';
import './activity.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Room Status',
              ),
              Tab(
                text: 'Activity',
              ),
              Tab(
                text: 'Members',
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          title: Text('INIT'),
        ),
        body: TabBarView(
          children: <Widget>[
            RoomStatus(),
            Activity(),
            Members(),
          ],
        ),
      ),
    );
  }
}
