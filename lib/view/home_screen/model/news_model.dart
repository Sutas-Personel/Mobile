class News {
  String sId;
  String title;
  String image;
  String content;
  String date;
  int iV;

  News({this.sId, this.title, this.image, this.content, this.date, this.iV});

  News.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['content'] = this.content;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
