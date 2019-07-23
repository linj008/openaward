class BannerData {
  int id;
  String picUrl;
  String httpUrl;
  String title;

  BannerData({this.id, this.picUrl, this.httpUrl, this.title});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picUrl = json['picUrl'];
    httpUrl = json['httpUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picUrl'] = this.picUrl;
    data['httpUrl'] = this.httpUrl;
    data['title'] = this.title;
    return data;
  }
}
