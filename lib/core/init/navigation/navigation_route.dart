import 'package:SutasPersonel/view/bottom_navigation/bottom_navigation.dart';
import 'package:SutasPersonel/view/forgot_password/forgot_password.dart';
import 'package:SutasPersonel/view/login_screen/login_screen.dart';
import 'package:SutasPersonel/view/onboarding_screen/onboarding_view.dart';
import 'package:SutasPersonel/view/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/card_detail_screen/cardDetail.dart';
import '../../../view/story_screen/story_screen.dart';
import '../../constants/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    // args.arguments
    switch (args.name) {
      case NavigationConstants.CARD_DETAIL:
        return normalNavigate(CardDetail(), args.arguments);
        break;
      case NavigationConstants.STORY_DETAIL:
        return normalNavigate(StoryScreen(), args.arguments);
        break;
      case NavigationConstants.LOGIN_PAGE:
        return normalNavigate(LoginScreen(), args.arguments);
        break;
      case NavigationConstants.BOTTOM_NAVIGATION_PAGE:
        return normalNavigate(BottomNavigation(), args.arguments);
        break;
      case NavigationConstants.REGISTER_PAGE:
        return normalNavigate(RegisterPage(), args.arguments);
        break;
      case NavigationConstants.ONBOARDING:
        return normalNavigate(OnboardingScreen(), args.arguments);
        break;
      case NavigationConstants.FORGOT_PASSWORD_PAGE:
        return normalNavigate(ForgotPassword(), args.arguments);
        break;

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Container(child: Text("ERROR 101")),
          ),
        );
        break;
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String id) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(
        arguments: id,
      ),
    );
  }
}
