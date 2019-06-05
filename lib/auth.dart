import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:init_app/apppage.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String username = '';
  String password = '';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/auth.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(255, 255, 255, 0.39),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  width: 350.0,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'INIT',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontFamily: 'bold',
                              wordSpacing: 10.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            onSaved: (String value) {
                              setState(
                                () {
                                  username = value;
                                  print(username);
                                },
                              );
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                              ),
                            ),
                            maxLength: 20,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            onSaved: (String value) {
                              setState(
                                () {
                                  password = value;
                                  print(password);
                                },
                              );
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.0,
                                  ),
                                ),
                              ),
                            ),
                            maxLength: 20,
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            _formkey.currentState.save();
                            final Map<String, String> userdata = {
                              'username': username,
                              'password': password,
                            };
                            print(userdata);
                            http.post(
                              'https://workplace-e3f7b.firebaseio.com/userdata.json',
                              body: json.encode(userdata),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return AppStartPage();
                                },
                              ),
                            );
                            print(userdata);
                          },
                          color: Colors.white,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('LOG IN'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
