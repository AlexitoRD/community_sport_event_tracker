import 'package:community_sport_event_tracker/authentication_page/authentication_page_model.dart';
import 'package:community_sport_event_tracker/data_classes/login_user.dart';
import 'package:community_sport_event_tracker/data_classes/registering_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  AuthenticationPageModel _authenticationPageModel = AuthenticationPageModel();

  var _isRegistering = false;
  var _passwordObscured = true;
  var _passwordConfirmationObscured = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  void initState() {
    _authenticationPageModel.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.6,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Container(
                width: width * 0.6,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _passwordObscured,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          _passwordObscured = !_passwordObscured;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _isRegistering,
                child: Container(
                  width: width * 0.6,
                  child: TextFormField(
                    controller: _passwordConfirmationController,
                    obscureText: _passwordConfirmationObscured,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _passwordConfirmationObscured =
                                !_passwordConfirmationObscured;
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
                  Visibility(
                    visible: _isRegistering,
                    child: FlatButton(
                      child: Text('Register'),
                      onPressed: () {
                        RegisteringUser registeringUser = RegisteringUser(
                            email: _emailController.text,
                            password: _passwordController.text,
                            confirmationPassword:
                                _passwordConfirmationController.text);
                        _authenticationPageModel.register(registeringUser);
                      },
                    ),
                  ),
                  Visibility(
                    visible: !_isRegistering,
                    child: FlatButton(
                      child: Text('Register now'),
                      onPressed: () {
                        setState(() {
                          _isRegistering = !_isRegistering;
                        });
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text('Login'),
                    onPressed: () {
                      LoginUser loginUser = LoginUser(
                          email: _emailController.text,
                          password: _passwordController.text);
                      _authenticationPageModel.login(loginUser);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
