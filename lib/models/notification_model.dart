import 'package:SutasPersonel/core/base/base_model.dart';

class NotificationsModel implements IBaseModel<NotificationsModel> {
  String important;
  String sId;
  String title;
  String subtitle;
  String date;
  int iV;

  NotificationsModel(
      {this.important,
      this.sId,
      this.title,
      this.subtitle,
      this.date,
      this.iV});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    important = json['important'];
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['important'] = this.important;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }

  @override
  NotificationsModel fromJson(Map<String, Object> json) {
    important = json['important'];
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    date = json['date'];
    iV = json['__v'];
  }
}
