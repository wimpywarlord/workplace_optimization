import 'package:flutter/material.dart';

class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Container(child: Image.asset('images/auth.jpg'),),
          title: Text('Member name'),
        )
      ],
    );
  }
}
