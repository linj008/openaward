import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
import 'package:opening_award/src/views/trade_page.dart';

import 'content_trade_record.dart';
import 'home/home_page.dart';
import 'lottery_control.dart';
import 'mine.dart';
import 'situation_page.dart';

/// main页面
// ignore: must_be_immutable
class FramePage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return _FramePageState();
  }
}

class _FramePageState extends BaseWidgetState<ViewBasicResponse, FramePage>
    with SingleTickerProviderStateMixin {
  List<PageModel> _pageList;
  TabController _controller;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageList = [
      PageModel('首页', Icon(Icons.home), HomePage()),
      PageModel('行情', Icon(Icons.card_giftcard), SituationPage()),
      PageModel('币币', Icon(Icons.insert_comment), TradePage()),
      PageModel('法币', Icon(Icons.assignment), TradeRecordPage()),
      PageModel('我的', Icon(Icons.person), MinePage()),
      PageModel('控制', Icon(Icons.content_cut), LotteryControlPage()),
    ];
    _controller = TabController(
      vsync: this,
      length: _pageList.length,
    );
    _controller.addListener(() => _currentIndex = _controller.index);
  }

  @override
  void upDate(ViewBasicResponse p) {}

  @override
  Widget build(BuildContext context) {
    if (_pageList == null) {
      return getLoadingWidget();
    } else {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: S.bgColor,
        ),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: _buildBottomItems(),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: S.themeColor,
            backgroundColor: S.bgColor,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: _pageList.map((item) => item.page).toList(),
          ),
        ),
      );
    }
  }

  List<BottomNavigationBarItem> _buildBottomItems() => _pageList
      .map((item) => BottomNavigationBarItem(
            title: Text(item.name),
            icon: item.icon,
          ))
      .toList();
}

class PageModel {
  String name;
  Widget icon;
  Widget page;

  PageModel(this.name, this.icon, this.page);
}
