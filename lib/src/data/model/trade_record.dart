class TradeRecord {
  int id;
  String title;
  double price;
  String name;
  int num;
  double percent;
  List<String> icons;
  int count;
  double minLimit;
  double maxLimit;
  int type;

  TradeRecord(
      {this.id,
      this.title,
      this.price,
      this.name,
      this.num,
      this.percent,
      this.icons,
      this.count,
      this.minLimit,
      this.maxLimit,
      this.type});

  TradeRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    name = json['name'];
    num = json['num'];
    percent = json['percent'];
    icons = json['icons'].cast<String>();
    count = json['count'];
    minLimit = json['minLimit'];
    maxLimit = json['maxLimit'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['name'] = this.name;
    data['num'] = this.num;
    data['percent'] = this.percent;
    data['icons'] = this.icons;
    data['count'] = this.count;
    data['minLimit'] = this.minLimit;
    data['maxLimit'] = this.maxLimit;
    data['type'] = this.type;
    return data;
  }
}

/// 0买入1卖出2委托3订单
class TradeType {
  /// 买入
  static const int inside = 0;

  /// 卖出
  static const int outside = 1;

  /// 委托
  static const int agent = 2;

  /// 订单
  static const int order = 3;
}
