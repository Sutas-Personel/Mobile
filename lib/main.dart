import 'package:SutasPersonel/core/constants/app_constants.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:SutasPersonel/view/notifications_screen/notifications.dart';
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
<<<<<<< HEAD
<<<<<<< features/notifications
      home: NotificationsScreen(),
=======
      home: Text("data"),
>>>>>>> development
=======
      home: NotificationsScreen(),
>>>>>>> 312bdae162f507f396e77ddf175e174a60242c72
    );
  }
}
