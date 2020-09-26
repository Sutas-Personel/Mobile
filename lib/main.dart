<<<<<<< HEAD
import 'package:SutasPersonel/core/constants/app_constants.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:SutasPersonel/view/login_screen/login_screen.dart';

import 'package:SutasPersonel/view/notifications_screen/notifications.dart';
import 'package:SutasPersonel/view/operations_screen/operations.dart';
import 'package:SutasPersonel/view/profil_screen/profil.dart';
import 'package:SutasPersonel/view/register_page/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
=======
>>>>>>> 5a92d17f8f493f6fb464a2b7176689d2c4a7dd29
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'view/story_screen/story_screen.dart';

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
      home: StoryScreen(),
    );
  }
}

class WrongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hata Var"),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("data")),
    );
  }
}
