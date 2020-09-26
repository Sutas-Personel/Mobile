import 'package:flutter/material.dart';

import '../../../view/bottom_navigation/bottom_navigation.dart';
import '../../../view/card_detail_screen/cardDetail.dart';
import '../../../view/forgot_password/forgot_password.dart';
import '../../../view/login_screen/login_screen.dart';
import '../../../view/onboarding_screen/onboarding_view.dart';
import '../../../view/register_page/register_page.dart';
import '../../../view/splash_screen/splash_screen.dart';

class Routes extends StatefulWidget {
  Routes({Key key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterPage(),
        '/bottom_navigation': (context) => BottomNavigation(),
        '/forgot_password': (context) => ForgotPassword(),
        '/card_detail_screen': (context) => CardDetail(),
      },
    );
  }
}
