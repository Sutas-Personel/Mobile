import 'package:SutasPersonel/view/home_screen/home_screen.dart';
import 'package:SutasPersonel/view/notifications_screen/notifications.dart';
import 'package:SutasPersonel/view/operations_screen/operations.dart';
import 'package:SutasPersonel/view/profil_screen/profil.dart';
import 'package:flutter/material.dart';
import './bottom_navigation.dart';

abstract class BottomNavigationViewModel extends State<BottomNavigation> {
  // Add your state and logic here

  int sellectedItem = 0;
  List<Widget> bottomPage;
  var main_page_key = PageStorageKey("main_page");
  var operation_key = PageStorageKey("operation_page");
  var notification_key = PageStorageKey("notification_page");
  var profile_key = PageStorageKey("profile_page");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomPage = [
      HomeScreen(main_page_key),
      OperationsScreen(operation_key),
      NotificationsScreen(notification_key),
      ProfilScreen(profile_key),
    ];
  }
}
