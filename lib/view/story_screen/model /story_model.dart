class Story {
  String url;
  String media;
  String duration;
  String user;

  Story({this.url, this.media, this.duration, this.user});

  Story.fromJson(Map<String, dynamic> json) {
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
}
