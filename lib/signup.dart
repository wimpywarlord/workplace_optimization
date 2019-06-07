import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  String username;
  String password;
  String skill;
  String mobileno;

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
                image: AssetImage('images/sign1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.49),
          ),
          Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    onSaved: (String value) {
                      username = value;
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
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    obscureText: true,
                    onSaved: (String value) {
                      password = value;
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
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    onSaved: (String value) {
                      skill = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Skill eg :- Web Dev , App Dev etc. ',
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
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    onSaved: (String value) {
                      mobileno = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Mobile No.',
                      contentPadding: EdgeInsets.all(20.0),
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
                    Map<String, String> userdata = {
                      'username': username,
                      'password': password,
                      'skill': skill,
                      'mobileno': mobileno
                    };
                    http.post(
                      'https://workplace-e3f7b.firebaseio.com/userdata.json',
                      body: json.encode(userdata),
                    );
                    print(userdata);
                  },
                  color: Colors.white,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text('SIGN IN'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
