import 'package:SutasPersonel/models/notification_model.dart';
import 'package:SutasPersonel/services/interfaces/INotificationServices.dart';
import 'package:SutasPersonel/services/notifications_services.dart';
import 'package:flutter/material.dart';
import 'notifications.dart';

abstract class NotificationsScreenViewModel extends State<NotificationsScreen> {
  INotificationService notificationService;
  List<NotificationsModel> getNotificationsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService = NotificationService.instance;
    // getNotificationsLists();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /* Future<void> getNotificationsLists() async {
    getNotificationsList = await notificationService.getNotificationList();
  } */
}
