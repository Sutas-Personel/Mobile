// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> tr = {
  "routeFailed": "Bir Sorun Oluştu",
  "profile": {
    "Profile": "Profil",
    "ProfilSettings": "Profil Ayarları",
    "Language": "Dil",
    "Theme": "Tema",
    "Exit": "Çıkış Yap"
  },
  "login": {
    "EmployeeLogin": "Çalışan Girişi",
    "Email": "E-mail",
    "Password": "Şifre",
    "LogIn": "Log In",
    "Or": "ya da",
    "Register": "Kayıt Ol",
    "ForgotPassword": "Şifremi Unuttum"
  }
};
static const Map<String,dynamic> en = {
  "routeFailed": "Bir sorun oluştu",
  "profile": {
    "Profile": "Profil",
    "ProfilSettings": "Profil Settings",
    "Language": "Language",
    "Theme": "Theme",
    "Exit": "Exit"
  },
  "login": {
    "EmployeeLogin": "Employee Login",
    "Email": "E-mail",
    "Password": "Password",
    "LogIn": "Log In",
    "Or": "Or",
    "Register": "Register",
    "ForgotPassword": "Forgot Password"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
