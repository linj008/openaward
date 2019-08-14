class NumberRecord {
  int id;
  String code;
  String number;

  NumberRecord({this.id, this.code, this.number});

  NumberRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['number'] = this.number;
    return data;
  }
}
