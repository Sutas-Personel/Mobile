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
    "ProfileSettings": "Profil Ayarları",
    "Language": "Dil",
    "Theme": "Tema",
    "Exit": "Çıkış Yap"
  },
  "login": {
    "Name": "İsim",
    "EmployeeLogin": "Çalışan Girişi",
    "Email": "E-mail",
    "Password": "Şifre",
    "LogIn": "Giriş Yap",
    "Or": "ya da",
    "AreYouRegistered": "Kayıtlı mısın ?",
    "Register": "Kayıt Ol",
    "ForgotPassword": "Şifremi Unuttum",
    "SendPasswordReset": "Send Password Reset Link"
  },
  "cardDetail": {
    "name": "İçerik Detay",
    "socialMediaShareText": "İçeriği sosyal medyada paylaş"
  },
  "home": {
    "name": "Zaman Akışı"
  },
  "notifications": {
    "name": "BİLDİRİMLER"
  },
  "operation": {
    "operationName": "İŞLEMLER",
    "permissionProcedures": "İzin İşlemleri",
    "administrativeOperations": "Yönetici İşlemleri",
    "serviceOperations": "Servis İşlemleri",
    "passwordOperations": "Parola İşlemleri",
    "collectionTransactions": "Tahsilat İşlemleri",
    "chillerOperations": "Soğutucu İşlemleri"
  },
  "navigationBar": {
    "home": "Ana Sayfa",
    "operations": "İşlemler",
    "notifications": "Bildirimler",
    "profile": "Profil"
  }
};
static const Map<String,dynamic> en = {
  "routeFailed": "Bir sorun oluştu",
  "profile": {
    "Profile": "Profile",
    "ProfileSettings": "Profile Settings",
    "Language": "Language",
    "Theme": "Theme",
    "Exit": "Exit"
  },
  "login": {
    "Name": "Name",
    "EmployeeLogin": "Employee Login",
    "Email": "E-mail",
    "Password": "Password",
    "LogIn": "Log In",
    "Or": "Or",
    "AreYouRegistered": "Are You Registered",
    "Register": "Register",
    "ForgotPassword": "Forgot Password",
    "SendPasswordReset": "Send Password Reset Link"
  },
  "cardDetail": {
    "name": "Content Detail",
    "socialMediaShareText": "Share content on social media"
  },
  "home": {
    "name": "Time Line"
  },
  "operation": {
    "operationName": "OPERATION",
    "permissionProcedures": "Permission Procedures",
    "administrativeOperations": "Administrative Operations",
    "serviceOperations": "Service Operations",
    "passwordOperations": "Password Operations",
    "collectionTransactions": "Collection Transactions",
    "chillerOperations": "Chiller Operations"
  },
  "notifications": {
    "name": "NOTIFICATIONS"
  },
  "navigationBar": {
    "home": "Home",
    "operations": "Operations",
    "notifications": "Notifications",
    "profile": "Profile"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
