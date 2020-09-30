import 'package:SutasPersonel/core/constants/font_size_const.dart';
import 'package:flutter/material.dart';

class ProfileListCard extends StatelessWidget {
  String title;
  IconData icon;

  ProfileListCard(this.icon, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: TextStyle(fontSize: FontSizeConst.SIXTEEN_PIXEL),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
