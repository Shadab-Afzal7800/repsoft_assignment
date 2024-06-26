import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:repsoft_assignment/screens/home_screen.dart';

class LoginServices {
  void login(BuildContext context, String email, String password) async {
    UserCredential? credentials;
    try {
      credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }

    if (credentials != null) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }
}
