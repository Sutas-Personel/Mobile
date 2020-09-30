import 'package:SutasPersonel/view/bottom_navigation/bottom_navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      locale: context.locale,
      title: 'Material App',
      home: BottomNavigation(),
    );
  }
}
