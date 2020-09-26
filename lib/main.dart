import 'package:SutasPersonel/core/constants/app_constants.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:SutasPersonel/view/content_detail/content_detail.dart';
import 'package:SutasPersonel/view/forgot_password/forgot_password.dart';
import 'package:SutasPersonel/view/login_screen/login_screen.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'view/card_detail_screen/cardDetail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(
      path: ApplicationConstants.LANGUAGE_ASSET_PATH,
      supportedLocales: LanguageManager.instance.supportedLocales,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CardDetail(),
    );
  }
}
