import 'package:SutasPersonel/models/notification_model.dart';

abstract class INotificationService {
  Future<List<NotificationsModel>> getNotificationList();
}
