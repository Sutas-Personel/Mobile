import 'package:flutter/material.dart';
import '../../core/components/button_widget.dart';
import '../../core/components/input_widget.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/file_path.dart';
import '../../core/constants/font_size_const.dart';
import '../../generated/locale_keys.g.dart';
import '../../generated/locale_keys.g.dart';
import './register_page_view_model.dart';
import '../../core/extension/context_entension.dart';
import 'package:SutasPersonel/core/extension/string_extension.dart';

class RegisterPageView extends RegisterPageViewModel {
  var nameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextContoller = TextEditingController();
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
              height: context.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  children: [
                    InputWidget(nameTextController,
                        LocaleKeys.login_Name.locale, nameFunc, false),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    InputWidget(emailTextController,
                        LocaleKeys.login_Email.locale, emailFunc, false),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    InputWidget(passwordTextContoller,
                        LocaleKeys.login_Password.locale, passFunc, true),
                    SizedBox(height: context.height * 0.08),
                    ButtonWidget(
                        LocaleKeys.login_LogIn.locale, registerOnpress),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: AllColors.INPUT_WHITE,
                          height: 2,
                          width: context.width * 0.25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            LocaleKeys.login_AreYouRegistered.locale,
                            style: TextStyle(color: AllColors.INPUT_WHITE),
                          ),
                        ),
                        Container(
                          color: AllColors.INPUT_WHITE,
                          height: 2,
                          width: context.width * 0.25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    ButtonWidget(LocaleKeys.login_Register.locale, onPressLogIn)
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
