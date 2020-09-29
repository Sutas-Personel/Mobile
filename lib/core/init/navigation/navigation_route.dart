/* import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    // args.arguments
    switch (args.name) {
      case NavigationConstants.BOOK_DETAIL_VIEW:
        return normalNavigate(BookDetail(), args.arguments);
        break;
      case NavigationConstants.BOOK_RESULT_VIEW:
        return normalNavigate(BookResult(), args.arguments);
        break;
      case NavigationConstants.BOOK_SELL_VIEW:
        return normalNavigate(BookSellsScreen(), args.arguments);
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginScreen(), args.arguments);
        break;
      case NavigationConstants.ONBOARDING_VIEW:
        return normalNavigate(OnBoardingScreens(), args.arguments);
        break;
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(ProfileScreen(), args.arguments);
        break;
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(RegisterScreen(), args.arguments);
        break;
      case NavigationConstants.SELLER_VIEW:
        return normalNavigate(SellersScreen(), args.arguments);
        break;
      case NavigationConstants.CATEGORY_CHOOSE_VIEW:
        return normalNavigate(CategoryChoose(), args.arguments);
        break;
      case NavigationConstants.HOME_SCREEN_VIEW:
        return normalNavigate(HomeScreen(), args.arguments);
        break;
      case NavigationConstants.NOTIFICATION_SCREEN_VIEW:
        return normalNavigate(NotificationScreen(), args.arguments);
        break;
      case NavigationConstants.SEARCH_SCREEN_VIEW:
        return normalNavigate(SearchScreen(), args.arguments);
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

  MaterialPageRoute normalNavigate(Widget widget, int id) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(
        arguments: id,
      ),
    );
  }
}
 */