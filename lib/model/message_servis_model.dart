class Message {
  String header;
  String desc;

  Message({this.header, this.desc});

  Message.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['desc'] = this.desc;
    return data;
  }
}