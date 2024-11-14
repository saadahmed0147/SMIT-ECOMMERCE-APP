import 'dart:async';

import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login {
  void isLogin(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    final user = firebaseAuth.currentUser;

    if (user != null) {
      debugPrint(user.toString());
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.home);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.login);
      });
    }
  }
}
