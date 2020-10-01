import 'package:SutasPersonel/core/base/base_model.dart';

class MediaType {
  static const String image = "IMAGE";
  static const String video = "VIDEO";
}
class StoryModel implements IBaseModel<StoryModel>{
  String media;
  String sId;
  String url;
  String duration;
  String user;
  int iV;

  StoryModel(
      {this.media, this.sId, this.url, this.duration, this.user, this.iV});

  StoryModel.fromJson(Map<String, dynamic> json) {
    media = json['media'];
    sId = json['_id'];
    url = json['url'];
    duration = json['duration'];
    user = json['user'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media'] = this.media;
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['user'] = this.user;
    data['__v'] = this.iV;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return StoryModel.fromJson(json);
  }
}
