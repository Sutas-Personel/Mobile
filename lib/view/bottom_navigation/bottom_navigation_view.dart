import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import './bottom_navigation_view_model.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../core/extension/string_extension.dart';
import '../../core/extension/context_entension.dart';

class BottomNavigationView extends BottomNavigationViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: bottomPage[sellectedItem],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              sellectedItem = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(color: context.theme.dividerColor),
          unselectedItemColor: AllColors.BLUE_GRAY,
          selectedItemColor: Theme.of(context).focusColor,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          currentIndex: sellectedItem,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(LocaleKeys.navigationBar_home.locale),
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesome5Solid.user_cog),
                title: Text(LocaleKeys.navigationBar_operations.locale)),
            BottomNavigationBarItem(
              title: Text(LocaleKeys.navigationBar_notifications.locale),
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              title: Text(LocaleKeys.navigationBar_profile.locale),
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
