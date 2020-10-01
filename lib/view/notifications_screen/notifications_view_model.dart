import 'package:SutasPersonel/models/notification_model.dart';
import 'package:SutasPersonel/services/interfaces/INotificationServices.dart';
import 'package:SutasPersonel/services/notifications_services.dart';
import 'package:flutter/material.dart';
import 'notifications.dart';

abstract class NotificationsScreenViewModel extends State<NotificationsScreen> {
  INotificationService notificationService;
  List<NotificationsModel> getNotificationsList;
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService = NotificationService.instance;
    getNotificationsLists();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getNotificationsLists() async {
    getNotificationsList = await notificationService.getNotificationList();
    return true;
  }
}
