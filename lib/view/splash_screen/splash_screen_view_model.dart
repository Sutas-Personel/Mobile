import 'package:flutter/material.dart';
import './splash_screen.dart';

abstract class SplashScreenViewModel extends State<SplashScreen> {
  // Add your state and logic here

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    });
  }
}
