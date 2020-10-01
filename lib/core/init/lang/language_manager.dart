import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instance;

  static LanguageManager get instance {
    if (_instance == null) _instance = LanguageManager.init();
    return _instance;
  }

  LanguageManager.init();

  final trLocale = Locale("tr");
  final enLocale = Locale("en");

  List<Locale> get supportedLocales => [trLocale, enLocale];
}
