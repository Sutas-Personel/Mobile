import 'package:SutasPersonel/core/constants/app_constants.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:SutasPersonel/view/content_detail/content_detail.dart';
import 'package:SutasPersonel/view/login_screen/login_screen.dart';

import 'package:SutasPersonel/view/notifications_screen/notifications.dart';
import 'package:SutasPersonel/view/operations_screen/operations.dart';
import 'package:SutasPersonel/view/profil_screen/profil.dart';
import 'package:SutasPersonel/view/register_page/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
>>>>>>> 0092ad724dd4c6a7d0a04c1762b444a586634a96
import 'package:easy_localization/easy_localization.dart';

import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'view/home_screen/home_screen.dart';

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
<<<<<<< HEAD
      home: OperationsScreen(),
=======
      home: HomeScreen(),
>>>>>>> 0092ad724dd4c6a7d0a04c1762b444a586634a96
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
