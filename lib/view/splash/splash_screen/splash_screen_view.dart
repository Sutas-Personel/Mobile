import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:flutter/material.dart';
import './splash_screen_view_model.dart';

class SplashScreenView extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AllColors.MAIN_GREEN, AllColors.NASTY_GREEN])),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
