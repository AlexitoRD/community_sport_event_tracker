import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 0.6,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          Container(
            width: width * 0.6,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text('Register'),
                onPressed: () {
                  print('Register');
                },
              ),
              FlatButton(
                child: Text('Login'),
                onPressed: () {
                  print('Login');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
