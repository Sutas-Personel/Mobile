import 'dart:io';

import 'package:SutasPersonel/core/constants/enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInHelper {
  static SignInHelper _signInHelper = SignInHelper._private();

  SignInHelper._private();
  BuildContext context;
  static SignInHelper instance() {
    return _signInHelper; // singelethon design pattern
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> signIn(String email, String password) async {
    var signInUser = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    return signInUser;
  }

  Future<User> register(String emaill, String passwordd) async {
    var user = (await auth.createUserWithEmailAndPassword(
            email: emaill, password: passwordd))
        .user;

    return user;
  }

  forgotPass(String emaill) {
    auth.sendPasswordResetEmail(email: emaill).then((resetPassword) {
      print(
          "Şifre güncelleme maili gönderildi lütfen e-mailinizi kontrol ediniz");
      auth.signOut();
    }).catchError((err) {
      print(
          "Şifre resetleme işlemi yapılırken hata çıktı ya da sistemimize böyle bir e-mail kayıtlı değil ");
    });
  }
}
