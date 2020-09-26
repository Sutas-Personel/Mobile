import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'view/home_screen/home_screen.dart';

void main() => runApp(EasyLocalization(
    path: ApplicationConstants.LANGUAGE_ASSET_PATH,
    supportedLocales: LanguageManager.instance.supportedLocales,
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
