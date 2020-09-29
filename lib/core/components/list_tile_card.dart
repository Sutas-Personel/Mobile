import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/models/notification_model.dart';
import 'package:flutter/material.dart';
import '../../core/extension/context_entension.dart';

class ListTileCard extends StatelessWidget {
  NotificationsModel message;

  ListTileCard({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(context.lowValue),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AllColors.MAIN_GREEN),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.lowValue),
                  child: Text(
                    message.title,
                    style: context.textTheme.bodyText1,
                  ),
                ),
                Text(message.subtitle, style: context.textTheme.caption)
              ],
            ),
          )
        ],
      ),
    );
  }
}
