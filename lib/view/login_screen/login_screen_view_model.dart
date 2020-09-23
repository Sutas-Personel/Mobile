import 'package:flutter/material.dart';
import './login_screen.dart';

abstract class LoginScreenViewModel extends State<LoginScreen> {
  // Add your state and logic here

  String email_valid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email)) {
      //regex içinde olan değerler olmadığında içeri girip ifadeyi return olarak döndürür.
      return "Geçersiz e-mail";
    } else {
      return null;
    }
  }

  void forgotOnpres() {
    print("forgot pass");
  }

  loginOnpress() {}

  onPressRegister() {}
}
