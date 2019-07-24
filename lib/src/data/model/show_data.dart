class ShowData {
  int id;
  String name;
  double point;
  double percent;
  double money;
  bool isPlus;

  ShowData(
      {this.id, this.name, this.point, this.percent, this.money, this.isPlus});

  ShowData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    point = json['point'];
    percent = json['percent'];
    money = json['money'];
    isPlus = json['isPlus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['point'] = this.point;
    data['percent'] = this.percent;
    data['money'] = this.money;
    data['isPlus'] = this.isPlus;
    return data;
  }
}
