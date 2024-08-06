import 'package:first/src/features/authentication/view/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenController {
  void start(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }
}
