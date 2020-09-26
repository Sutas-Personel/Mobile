import 'package:SutasPersonel/core/init/services/login_services.dart';
import 'package:flutter/material.dart';
import './forgot_password.dart';

abstract class ForgotPasswordViewModel extends State<ForgotPassword> {
  // Add your state and logic here

  var forgotPassController = TextEditingController();

  String emailValid(String string) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(string)) {
      //regex içinde olan değerler olmadığında içeri girip ifadeyi return olarak döndürür.
      return "Geçersiz e-mail";
    } else {
      return null;
    }
  }

  sendPasswordReset(BuildContext context) {
    SignInHelper.instance().forgotPass(forgotPassController.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forgotPassController.dispose();
  }
}
