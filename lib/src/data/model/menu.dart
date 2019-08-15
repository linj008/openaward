class Menu {
  int id;
  String icon;
  String name;
  List<Menu> children;
  bool check;

  Menu({this.id, this.icon, this.name, this.children, this.check});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    if (json['children'] != null) {
      children = List<Menu>();
      json['children'].forEach((v) {
        children.add(Menu.fromJson(v));
      });
    }
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['check'] = this.check;
    return data;
  }
}
