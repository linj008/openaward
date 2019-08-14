class Menu {
  int id;
  String icon;
  String name;
  List<Menu> children;

  Menu({this.id, this.icon, this.name, this.children});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
