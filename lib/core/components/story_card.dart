import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:flutter/material.dart';
import '../extension/context_entension.dart';

class StoryCard extends StatelessWidget {
  final String imgUrl;
  const StoryCard({
    Key key,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width * 0.20,
        child: Padding(
          padding: EdgeInsets.all(context.lowValue),
          child: CircleAvatar(
            radius: context.width * 0.08,
            backgroundColor: AllColors.MAIN_GREEN,
            child: CircleAvatar(
              radius: context.width * 0.075,
              backgroundImage: NetworkImage(imgUrl),
            ),
          ),
        ));
  }
}
