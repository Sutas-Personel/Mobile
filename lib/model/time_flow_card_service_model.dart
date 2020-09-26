TimeFlow content = TimeFlow(
    header: "SÜTAŞ’A MÜŞTERİ DENEYİMİNİ EN İYİ YÖNETEN MARKA ÖDÜLÜ",
    date: "05.12.2019 - 16.47",
    imgUrl:
        "https://www.sutas.com.tr/uploads/slides/home/diyar-market/desktop.jpg?20200926125128",
    desc: "Aliquip qui veniam pariatur magna Aliquip qui veniam pariatur magnaAliquip qui veniam pariatur magna tempor sunt aliqua adipisicing non aliquip incididunt ad aliqua et.Duis qui mollit labore est sint reprehenderit Lorem cillum.");

class TimeFlow {
  String header;
  String date;
  String imgUrl;
  String desc;

  TimeFlow({this.header, this.date, this.imgUrl, this.desc});

  TimeFlow.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    date = json['date'];
    imgUrl = json['imgUrl'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['date'] = this.date;
    data['imgUrl'] = this.imgUrl;
    data['desc'] = this.desc;
    return data;
  }
}
