import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:init_app/apppage.dart';
import 'package:init_app/signup.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String checkusername = '';
  String checkpassword;
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
                                  checkusername = value;
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
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            obscureText: true,
                            onSaved: (String value) {
                              setState(
                                () {
                                  checkpassword = value;
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return SignUpPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign Up |',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                'Terms and Conditions.',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            _formkey.currentState.save();
                            http
                                .get(
                                    'https://work-fb68d.firebaseio.com/userdata.json')
                                .then((http.Response response) {
                              Map<String, dynamic> userlist =
                                  json.decode(response.body);
                              userlist.forEach((String id, dynamic userdata) {
                                print(userlist[id]['username']);
                                print(checkusername);
                                print(userlist[id]['password']);
                                print(checkpassword);

                                if (userlist[id]['username'] == checkusername &&
                                    userlist[id]['password'] == checkpassword) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return AppStartPage();
                                      },
                                    ),
                                  );
                                } else {
                                  print('fail');
                                }
                              });
                            });
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
