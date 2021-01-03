import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isRegistering = false;
  var passwordObscured = true;
  var passwordConfirmationObscured = true;

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
              obscureText: passwordObscured,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      passwordObscured = !passwordObscured;
                    });
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isRegistering,
            child: Container(
              width: width * 0.6,
              child: TextFormField(
                obscureText: passwordConfirmationObscured,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        passwordConfirmationObscured =
                            !passwordConfirmationObscured;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text('Register'),
                onPressed: () {
                  setState(() {
                    isRegistering = !isRegistering;
                  });
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
