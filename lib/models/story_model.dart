import 'package:SutasPersonel/core/base/base_model.dart';

class StoryModel implements BaseModel<StoryModel> {
  String url;
  String media;
  String duration;
  String user;

  StoryModel({this.url, this.media, this.duration, this.user});

  StoryModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    media = json['media'];
    duration = json['duration'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['media'] = this.media;
    data['duration'] = this.duration;
    data['user'] = this.user;
    return data;
  }

  @override
  StoryModel fromJson(Map<String, Object> json) {
    url = json['url'];
    media = json['media'];
    duration = json['duration'];
    user = json['user'];
    throw UnimplementedError();
  }
}
