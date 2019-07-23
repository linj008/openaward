import 'dart:convert';
import 'local_json.dart';
import 'model/menu.dart';

class LocalData {
  static List<Menu> _gridMenus;
  static List<Menu> _listMenus;

  static List<Menu> _$menus(String localJson) {
    List<Menu> list = List();
    List listJson = json.decode(localJson);
    list = listJson.map((i) => Menu.fromJson(i)).toList();
    return list;
  }

  static List<Menu> getGridMenu() => _gridMenus ??= _$menus(LocalJson.gridMenu);

  static List<Menu> getListMenu() => _listMenus ??= _$menus(LocalJson.listMenu);
}
