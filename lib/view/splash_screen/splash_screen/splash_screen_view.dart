import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/core/constants/font_size_const.dart';
import 'package:flutter/material.dart';
import './splash_screen_view_model.dart';
import 'package:SutasPersonel/core/extension/context_entension.dart';
import 'package:SutasPersonel/core/constants/file_path.dart';

class SplashScreenView extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topLeft,
                colors: [
              AllColors.MAIN_GREEN,
              AllColors.NASTY_GREEN,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(FilePathConst.SUTAS_LOGO.toString()),
            ),
            SizedBox(height: context.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SÜT",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AllColors.INPUT_WHITE,
                      fontSize: FontSizeConst.THIRTY_PIXEL),
                ),
                Text(
                  "AŞK",
                  style: TextStyle(
                      color: AllColors.INPUT_WHITE,
                      fontWeight: FontWeight.w800,
                      fontSize: FontSizeConst.THIRTY_PIXEL),
                )
              ],
            ),
            SizedBox(height: context.height * 0.006),
            Text(
              "Personel İçerik Sistemi",
              style: context.textTheme.headline5.copyWith(
                  color: AllColors.INPUT_WHITE,
                  fontSize: FontSizeConst.EIGHTEEN_PIXEL,
                  fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }
}
