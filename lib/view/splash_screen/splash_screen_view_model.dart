import 'package:SutasPersonel/core/constants/navigation_constants.dart';
import 'package:SutasPersonel/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import './splash_screen.dart';

abstract class SplashScreenViewModel extends State<SplashScreen>
    with BaseViewModel {
  // Add your state and logic here

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      navigation.navigateToPageClear(path: NavigationConstants.LOGIN_PAGE);
    });
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
