import 'package:SutasPersonel/core/init/cache/locale_manager.dart';
import 'package:SutasPersonel/core/init/routes/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/bottom_navigation/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.prefrencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        path: ApplicationConstants.LANGUAGE_ASSET_PATH,
        supportedLocales: LanguageManager.instance.supportedLocales,
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
        theme: Provider.of<ThemeNotifier>(
          context,
          listen: true,
        ).currentTheme,
        locale: context.locale,
        title: 'Material App',
        home: BottomNavigation());
  }
}
