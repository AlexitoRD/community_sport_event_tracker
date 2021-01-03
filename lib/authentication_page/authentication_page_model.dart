import 'package:community_sport_event_tracker/data_classes/login_user.dart';
import 'package:community_sport_event_tracker/data_classes/registering_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationPageModel {
  void initialize() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is signed out');
      } else {
        print(user.email);
        print('User is signed in');
      }
    });
  }

  bool _confirmPassword(RegisteringUser registeringUser) {
    if (registeringUser.email.isEmpty) {
      //TODO: Event saying email is empty
      print('Empy email');
      return false;
    }
    if (registeringUser.password.isEmpty ||
        registeringUser.confirmationPassword.isEmpty) {
      print('Empty password');
      //TODO: Event saying password is empty
      return false;
    }
    if (registeringUser.password != registeringUser.confirmationPassword) {
      //TODO: Event that says passwords dont match
      print('Passwords dont match');
      return false;
    } else {
      print('Good info');
      return true;
    }
  }

  void register(RegisteringUser registeringUser) async {
    if (_confirmPassword(registeringUser)) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: registeringUser.email,
                password: registeringUser.password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void login(LoginUser loginUser) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginUser.email, password: loginUser.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
