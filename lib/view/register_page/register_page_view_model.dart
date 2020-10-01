import 'package:SutasPersonel/core/init/services/login_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './register_page.dart';

abstract class RegisterPageViewModel extends State<RegisterPage> {
  // Add your state and logic here

  var formkey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var nameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextContoller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String nameFunc(String string) {
    //deneme
  }

  String emailFunc(String string) {
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

  String passFunc(String valid) {
    if (valid.length <= 6) {
      return "Şifre 6 karakterden uzun olmalı";
    } else {
      return null;
    }
  }

  onPressLogIn() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  registerOnpress(BuildContext context) async {
    formkey.currentState.validate();
    var firebaseUser = await SignInHelper.instance()
        .register(emailTextController.text, passwordTextContoller.text);

    if (firebaseUser != null) {
      firebaseUser.sendEmailVerification().then((sendEmailVerfctn) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
                "Hesabınıza göndermiş olduğumuz e-maildeki linkten hesabınızı aktive edebilirsiniz")));

        auth.signOut();
      }).catchError((verificationError) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
                "Email aktivasyon gönderilirken hata çıktı \n Hata kodu : $verificationError")));
      });
    } else {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Bu hesap kullanımda")));
      print("bu hesap kullanımda");
    }
  }
}
