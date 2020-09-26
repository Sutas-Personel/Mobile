import 'package:SutasPersonel/core/components/button_widget.dart';
import 'package:SutasPersonel/core/components/input_widget.dart';
import 'package:SutasPersonel/core/init/services/login_services.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/file_path.dart';
import '../../core/constants/font_size_const.dart';
import './login_screen_view_model.dart';
import 'package:SutasPersonel/core/extension/string_extension.dart';
import 'package:SutasPersonel/core/extension/context_entension.dart';

class LoginScreenView extends LoginScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topLeft,
                colors: [
              AllColors.MAIN_GREEN,
              AllColors.NASTY_GREEN,
            ])),
        width: context.width,
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Expanded(flex: 3, child: sutasLogo()),
            Expanded(flex: 1, child: sutasEmployeeText()),
            SizedBox(
              height: context.height * 0.04,
            ),
            Expanded(
                flex: 12,
                child: loginInputArea(
                    emailController, context, passwordController)),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Container loginInputArea(TextEditingController emailController,
      BuildContext context, TextEditingController passworController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InputWidget(emailController, LocaleKeys.login_Email.locale,
                email_valid, false),
            SizedBox(
              height: context.height * 0.03,
            ),
            InputWidget(passwordController, LocaleKeys.login_Password.locale,
                passValid, true),
            SizedBox(
              height: context.height * 0.019,
            ),
            GestureDetector(
              onTap: forgotOnpres,
              child: Text(
                LocaleKeys.login_ForgotPassword.locale,
                style: TextStyle(
                    color: AllColors.INPUT_WHITE, fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              height: context.height * 0.035,
            ),
            ButtonWidget(
                LocaleKeys.login_LogIn.locale, () => loginOnpress(context)),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: AllColors.INPUT_WHITE,
                  height: 2,
                  width: context.width * 0.36,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    LocaleKeys.login_Or.locale,
                    style: TextStyle(color: AllColors.INPUT_WHITE),
                  ),
                ),
                Container(
                  color: AllColors.INPUT_WHITE,
                  height: 2,
                  width: context.width * 0.36,
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            ButtonWidget(LocaleKeys.login_Register.locale, onPressRegister),
          ],
        ),
      ),
    );
  }

  Text sutasEmployeeText() {
    return Text(
      LocaleKeys.login_EmployeeLogin.locale,
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
