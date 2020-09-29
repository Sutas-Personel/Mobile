import 'package:SutasPersonel/core/components/list_tile_card.dart';
import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:SutasPersonel/models/notification_model.dart';
import 'package:SutasPersonel/services/notifications_services.dart';
import 'package:flutter/material.dart';
import '../../core/extension/context_entension.dart';
import 'notifications_view_model.dart';
import '../../core/extension/string_extension.dart';
import '../../core/extension/future_builder.dart';

class NotificationsScreenView extends NotificationsScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          LocaleKeys.notifications_name.locale.toString(),
          style:
              context.textTheme.headline6.copyWith(color: AllColors.MAIN_GREEN),
        ),
        actions: [Icon(Icons.menu, color: AllColors.MAIN_GREEN)],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Future.value(NotificationService.instance.getNotificationList())
          .toBuild<Object>(onSuccess: (data) {
        return notificationsList(data);
      }),
    );
  }

  ListView notificationsList(List<NotificationsModel> notificationsList) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: notificationsList.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        child: ListTileCard(
          message: notificationsList[index],
        ),
        onDismissed: (direction) {
          setState(() {
            notificationsList.removeAt(index);
          });
        },
        secondaryBackground: Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: context.lowValue),
              child: Icon(Icons.cancel, color: Colors.white),
            ),
            color: context.colors.error),
        background: Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: context.lowValue),
              child: Icon(Icons.cancel, color: Colors.white),
            ),
            color: context.colors.error),
      ),
    );
  }
}
