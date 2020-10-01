import 'package:flutter/material.dart';
import '../../core/components/button_widget.dart';
import '../../core/components/input_widget.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/file_path.dart';
import '../../core/constants/font_size_const.dart';
import '../../generated/locale_keys.g.dart';
import './register_page_view_model.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';

class RegisterPageView extends RegisterPageViewModel {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      key: scaffoldKey,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(flex: 5, child: sutasLogo()),
            Expanded(flex: 1, child: sutasEmployeeText()),
            Expanded(
              flex: 1,
              child: emptySizeBox(context),
            ),
            Expanded(flex: 12, child: textFormInputs(context)),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  SizedBox emptySizeBox(BuildContext context) {
    return SizedBox(
      height: context.height * 0.01,
    );
  }

  Padding textFormInputs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            InputWidget(nameTextController, LocaleKeys.login_Name.locale,
                nameFunc, false),
            SizedBox(
              height: context.height * 0.02,
            ),
            InputWidget(emailTextController, LocaleKeys.login_Email.locale,
                emailFunc, false),
            SizedBox(
              height: context.height * 0.02,
            ),
            InputWidget(passwordTextContoller, LocaleKeys.login_Password.locale,
                passFunc, true),
            SizedBox(height: context.height * 0.03),
            ButtonWidget(LocaleKeys.login_Register.locale,
                () => registerOnpress(context)),
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
            ButtonWidget(LocaleKeys.login_LogIn.locale, onPressLogIn)
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
