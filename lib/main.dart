import 'package:SutasPersonel/core/constants/app_constants.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => runApp(EasyLocalization(
    path: ApplicationConstants.LANGUAGE_ASSET_PATH,
    supportedLocales: LanguageManager.instance.supportedLocales,
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Text("data"),
    );
  }
}
