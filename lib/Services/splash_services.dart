import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    final user = firebaseAuth.currentUser;

    // Check if the user is logged in or not
    if (user != null) {
      // User is logged in, navigate to Home screen
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.home);
      });
    } else {
      // User is not logged in, navigate to Login screen
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.login);
      });
    }
  }
}
