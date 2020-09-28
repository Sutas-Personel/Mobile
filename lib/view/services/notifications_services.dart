import 'package:SutasPersonel/core/constants/http_request_enum.dart';
import 'package:SutasPersonel/view/models/notification_model.dart';
import 'package:SutasPersonel/view/models/response.dart';
import 'package:SutasPersonel/view/models/story_model.dart';
import 'package:SutasPersonel/view/services/base_services.dart';
import 'package:dio/dio.dart';

import 'interfaces/INotificationServices.dart';

class Notification extends BaseService implements INotificationService {
  static Notification _instance;
  static Notification get instance {
    if (_instance == null) _instance = Notification._init();
    return _instance;
  }

  Notification._init();

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
