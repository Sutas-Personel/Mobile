import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:flutter/material.dart';
import './bottom_navigation_view_model.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
          unselectedLabelStyle: TextStyle(color: AllColors.BLUE_GRAY),
          unselectedItemColor: AllColors.BLUE_GRAY,
          selectedItemColor: AllColors.MAIN_GREEN,
          currentIndex: sellectedItem,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesome5Solid.user_cog),
                title: Text("İşlemler")),
            BottomNavigationBarItem(
              title: Text("Bildirimler"),
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              title: Text("Profil"),
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
