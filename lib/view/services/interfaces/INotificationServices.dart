import 'package:SutasPersonel/view/models/notification_model.dart';

abstract class INotificationService {
  Future<List<NotificationsModel>> getNotificationList();
}
