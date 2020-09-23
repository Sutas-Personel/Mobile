import 'package:SutasPersonel/core/components/button_widget.dart';
import 'package:SutasPersonel/core/components/input_widget.dart';
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
    var email_controller = TextEditingController();
    var password_controller = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // Replace this with your build function
    return Scaffold(
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
            Container(
              child: Image.asset(FilePathConst.SUTAS_LOGO),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Text(
              LocaleKeys.login_EmployeeLogin.locale,
              style: TextStyle(
                  fontSize: FontSizeConst.TWENTY_EIGHT_PIXEL,
                  color: AllColors.BUTTON_WHITE,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.60),
            ),
            SizedBox(
              height: context.height * 0.08,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InputWidget(email_controller, LocaleKeys.login_Email.locale,
                        email_valid, false),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    InputWidget(password_controller,
                        LocaleKeys.login_Password.locale, email_valid, true),
                    SizedBox(
                      height: context.height * 0.019,
                    ),
                    GestureDetector(
                      onTap: forgotOnpres,
                      child: Text(
                        LocaleKeys.login_ForgotPassword.locale,
                        style: TextStyle(
                            color: AllColors.INPUT_WHITE,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.035,
                    ),
                    ButtonWidget(LocaleKeys.login_LogIn.locale, loginOnpress),
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
                    ButtonWidget(
                        LocaleKeys.login_Register.locale, onPressRegister)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
