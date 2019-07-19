import 'dart:convert';

import 'local_json.dart';
import 'model/menu.dart';

class JsonData {
  static List<Menu> _gridMenus;
  static List<Menu> _listMenus;

  static List<Menu> _$menus(String localJson) {
    List<Menu> list = List();
    List listJson = json.decode(localJson);
    list = listJson.map((i) => Menu.fromJson(i)).toList();
    return list;
  }

  static List<Menu> getGridMenu() =>
      _gridMenus ??= _$menus(JsonString.gridMenu);

  static List<Menu> getListMenu() =>
      _listMenus ??= _$menus(JsonString.listMenu);
}
