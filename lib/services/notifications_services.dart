import 'package:SutasPersonel/core/constants/http_enums.dart';
import 'package:SutasPersonel/models/notification_model.dart';
import 'package:SutasPersonel/models/response.dart';
import 'package:SutasPersonel/services/base_services.dart';

import 'package:dio/dio.dart';

import 'interfaces/INotificationServices.dart';

class NotificationService extends BaseService implements INotificationService {
  static NotificationService _instance;
  static NotificationService get instance {
    if (_instance == null) _instance = NotificationService._init();
    return _instance;
  }

  NotificationService._init();

  @override
  Future<List<NotificationsModel>> getNotificationList() async {
    return (await coreDio.fetch<List<NotificationsModel>, NotificationsModel>(
            "notifications/getAll",
            type: HttpTypes.GET,
            parseModel: NotificationsModel()))
        .data;
  }

  Future<response> makeComment(
      String title, String subtitle, String important) async {
    FormData formData = FormData.fromMap({
      'title': title,
      'subtitle': subtitle,
      'important': important,
    });
    response data = (await coreDio.fetch<response, response>(
            "notifications/add/",
            type: HttpTypes.POST,
            parseModel: response(),
            data: formData))
        .data;
    return data;
  }
}
