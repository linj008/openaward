class Menu {
  int id;
  String icon;
  String name;
  String http;

  Menu({this.id, this.icon, this.name, this.http});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    http = json['http'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['http'] = this.http;
    return data;
  }
}
