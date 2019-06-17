import 'package:flutter/material.dart';
import 'package:init_app/roomstatus.dart';

import './members.dart';
import './activity.dart';

class AppStartPage extends StatefulWidget {
  final String currentusername;
  final String currentskill;
  final String currentmobileno;
  final Map<String, dynamic> userlist;
  @override
  AppStartPage(this.userlist, this.currentusername, this.currentskill,
      this.currentmobileno);

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
                text: 'Activity',
              ),
              Tab(
                text: 'Room Status',
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
            Activity(widget.currentusername, widget.currentskill,
                widget.currentmobileno, widget.userlist),
            RoomStatus(),
            Members(widget.userlist),
          ],
        ),
      ),
    );
  }
}
