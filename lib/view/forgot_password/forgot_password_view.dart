import 'package:SutasPersonel/core/components/button_widget.dart';
import 'package:SutasPersonel/core/components/input_widget.dart';
import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/core/constants/file_path.dart';
import 'package:SutasPersonel/core/constants/font_size_const.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import './forgot_password_view_model.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';

class ForgotPasswordView extends ForgotPasswordViewModel {
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
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(flex: 1, child: sutasLogo()),
            Expanded(flex: 1, child: sutasTextForgotPass()),
            Expanded(flex: 2, child: inputArea(context)),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Container inputArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InputWidget(forgotPassController, LocaleKeys.login_Email.locale,
              emailValid, false),
          SizedBox(
            height: context.height * 0.06,
          ),
          ButtonWidget(LocaleKeys.login_SendPasswordReset.locale,
              () => sendPasswordReset(context))
        ],
      ),
    );
  }

  Text sutasTextForgotPass() {
    return Text(
      LocaleKeys.login_ForgotPassword.locale,
      style: TextStyle(
          fontSize: FontSizeConst.TWENTY_EIGHT_PIXEL,
          color: AllColors.BUTTON_WHITE,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.60),
    );
  }

  Container sutasLogo() {
    return Container(
      child: Image.asset(FilePathConst.SUTAS_LOGO),
    );
  }
}
