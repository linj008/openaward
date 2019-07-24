class Menu {
  int id;
  String icon;
  String name;

  Menu({this.id, this.icon, this.name});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    return data;
  }
}
