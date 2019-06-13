import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Members extends StatelessWidget {
  final Map<String, dynamic> userlist;

  Members(this.userlist);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: userlist.length,
            itemBuilder: (BuildContext context, int index) {
              //print('hello');
              final List keys = userlist.keys.toList();
              return ListTile(
                trailing: Icon(
                  Icons.check,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Skill :  ' + userlist[keys[index]]['skill'],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Contact info :  ' + userlist[keys[index]]['mobileno'],
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                contentPadding: EdgeInsets.all(10.0),
                leading: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      'images/man.png',
                      fit: BoxFit.cover,
                      height: 150.0,
                      width: 58.0,
                    ),
                  ),
                ),
                title: Text(
                  userlist[keys[index]]['username'].toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
