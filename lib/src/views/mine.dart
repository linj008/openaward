import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
import 'package:opening_award/src/data/json_data.dart';
import 'package:opening_award/src/data/model/menu.dart';

// ignore: must_be_immutable
class MinePage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return MineState();
  }
}

class MineState extends BaseWidgetState<ViewBasicResponse, MinePage> {
  bool _isShow = true;
  List<Menu> _gridMenus;
  List<Menu> _listMenus;

  @override
  void upDate(ViewBasicResponse p) {}

  @override
  void initState() {
    super.initState();
    this._gridMenus = JsonData.getGridMenu();
    this._listMenus = JsonData.getListMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("我的账户"), actions: <Widget>[
          GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Image.asset("assets/images/ic_set.png",
                      height: 24, width: 24)))
        ]),
        body: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff1B4EE1), Color(0xff2eb7ff)]),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 180,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: ClipOval(
                                    child: Image.asset(
                                        "assets/images/logo.jpeg",
                                        height: 60,
                                        width: 60))),
                            Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('总资产（￥）',
                                          style: APPStyle.whiteMidTextStyle),
                                      Text('${_isShow ? '0.00' : '******'}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24))
                                    ]))
                          ]),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isShow = !_isShow;
                                });
                              },
                              child: Image.asset(
                                  _isShow
                                      ? 'assets/images/icon_hide.png'
                                      : 'assets/images/icon_display.png',
                                  height: 20,
                                  width: 20))
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('我的钱包', style: APPStyle.whiteMidTextStyle),
                          Container(color: Colors.white, width: 1, height: 16),
                          Text('法币账户', style: APPStyle.whiteMidTextStyle),
                          Container(color: Colors.white, width: 1, height: 16),
                          Text('币币账户', style: APPStyle.whiteMidTextStyle)
                        ])
                  ])),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: _gridMenus.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildGridItem(_gridMenus[index]);
              }),
          Container(color: Color(0xfff8f8f8), height: 16),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _listMenus.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListItem(_listMenus[index]);
              })
        ]));
  }

  Widget _buildGridItem(Menu menu) {
    return GestureDetector(
        onTap: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(menu.icon, height: 24, width: 24),
              Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(menu.name,
                      style: TextStyle(color: Colors.black, fontSize: 16)))
            ]));
  }

  Widget _buildListItem(Menu menu) {
    return InkWell(
        onTap: () {},
        child: Column(children: <Widget>[
          Container(
              height: 50,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(menu.name,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    Image.asset(menu.icon, height: 16, width: 16)
                  ])),
          Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Divider(height: 1))
        ]));
  }
}
