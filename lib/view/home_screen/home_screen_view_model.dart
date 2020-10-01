import 'package:SutasPersonel/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

abstract class HomeScreenViewModel extends State<HomeScreen> with BaseViewModel{
 
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}