import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInHelper {
  static SignInHelper _signInHelper = SignInHelper._private();

  SignInHelper._private();

  static SignInHelper instance() {
    return _signInHelper; // singelethon design pattern
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  signIn(String email, String password) async {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((signUser) {
      var signInUser = signUser.user;
      if (signInUser.emailVerified) {
        print("email onaylı kullanıcı giriş yapıyor");
        print("uid ${signInUser.uid}");
      } else {
        debugPrint(
            "E-mail adresinize e-posta gönderdik giriş yapmak için lütfen onaylayın");
        signInUser.sendEmailVerification();
        auth.signOut();
      }
    }).catchError((signInError) {
      print("E-mail ya da şifre hatalı");
    });
  }

  register(String emaill, String passwordd) async {
    var authResult = await auth
        .createUserWithEmailAndPassword(email: emaill, password: passwordd)
        .catchError((err) => debugPrint("bir hata oluştu hata :$err "));

    var firebaseUser = authResult.user;

    if (firebaseUser != null) {
      firebaseUser.sendEmailVerification().then((sendEmailVeri) {
        print("E-mail adresinize aktivasyon gönderildi lütfen onaylayın");
        auth.signOut();
      }).catchError((verificationError) {
        print(
            "Email aktivasyon gönderilirken hata çıktı \n Hata kodu : $verificationError");
      });
    } else {
      print("Bu E-mail kullanımda");
    }
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
