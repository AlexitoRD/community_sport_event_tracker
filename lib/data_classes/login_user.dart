import 'package:dataclass/dataclass.dart';
import 'package:flutter/cupertino.dart';

@dataClass
class LoginUser {
  final String email;
  final String password;

  LoginUser({@required this.email, @required this.password});
}
