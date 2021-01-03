import 'package:dataclass/dataclass.dart';
import 'package:flutter/cupertino.dart';

@dataClass
class RegisteringUser {
  final String email;
  final String password;
  final String confirmationPassword;

  RegisteringUser(
      {@required this.email,
      @required this.password,
      @required this.confirmationPassword});
}
