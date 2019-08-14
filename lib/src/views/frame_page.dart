import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
import 'package:opening_award/src/views/page_data.dart';
import 'package:opening_award/src/views/trade_page.dart';

import 'content_trade_record.dart';
import 'home/home_page.dart';
import 'mine.dart';
import 'situation_page.dart';

class FramePage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return new _FramePageState();
  }
}

class _FramePageState extends BaseWidgetState<ViewBasicResponse, FramePage>
    with SingleTickerProviderStateMixin {
  List<PageModle> _pageList;

  TabController controller;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    PageModle homeModle = new PageModle();
    HomePage homeView = HomePage();
    homeModle.page = homeView;
    homeModle.pageName = "首页";

    PageModle quotationModle = new PageModle();
    SituationPage situationView = SituationPage();
    quotationModle.page = situationView;
    quotationModle.pageName = "行情";

    PageModle tradeModle = new PageModle();
    TradePage tradePage = TradePage();
    tradeModle.page = tradePage;
    tradeModle.pageName = "币币";

    PageModle recordModel = new PageModle();
    TradeRecordPage tradeRecordPage = TradeRecordPage();
    recordModel.page = tradeRecordPage;
    recordModel.pageName = "法币";

    PageModle mineModle = new PageModle();
    MinePage minePage = MinePage();
    mineModle.page = minePage;
    mineModle.pageName = "我的";
    _pageList = [homeModle, quotationModle, tradeModle, recordModel, mineModle];
    controller = new TabController(length: _pageList.length, vsync: this);
    controller.addListener(() => _currentIndex = controller.index);
  }

  @override
  void upDate(ViewBasicResponse p) {
    // TODO: implement upDate
  }

  @override
  Widget build(BuildContext context) {
    if (_pageList == null) {
      return getLoadingWidget();
    } else {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: APPStyle.themeColor,
        ),
        home: Scaffold(
          bottomNavigationBar: new BottomNavigationBar(
            items: buildBottomItems(),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            unselectedItemColor: Color(0xFF9D9D9D),
            selectedItemColor: Color(0xFF3C6AEF),
            backgroundColor: APPStyle.themeColor,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: _pageList.map((item) {
              return item.page;
            }).toList(),
          ),
        ),
      );
    }
  }

  Widget buildIcon(PageModle item) {
    Widget icon;
    switch (item.pageName) {
      case "首页":
        icon = Icon(Icons.home);
        break;
      case "行情":
        icon = Icon(Icons.card_giftcard);
        break;
      case "币币":
        icon = Icon(Icons.insert_comment);
        break;
      case "法币":
        icon = Icon(Icons.assignment);
        break;
      case "我的":
        icon = Icon(Icons.person);
        break;
    }
    return icon;
  }

  List<BottomNavigationBarItem> buildBottomItems() {
    return _pageList.map((item) {
      Widget icon = buildIcon(item);
      return BottomNavigationBarItem(
        title: Text(item.pageName),
        icon: icon,
      );
    }).toList();
  }
}
