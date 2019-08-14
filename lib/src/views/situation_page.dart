import 'package:flutter/material.dart';
import 'package:opening_award/src/data/model/menu.dart';
import 'package:opening_award/src/data/model/number_record.dart';
import 'package:opening_award/src/data/test_data.dart';

import '../common/app_style.dart';
import '../common/base_data.dart';
import '../common/weight/base_stateful_widget.dart';

/// 行情页面
// ignore: must_be_immutable
class SituationPage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() =>
      _SituationPageState();
}

class _SituationPageState
    extends BaseWidgetState<ViewBasicResponse, SituationPage>
    with SingleTickerProviderStateMixin {
  List<Menu> _tabTypes;
  List<NumberRecord> _numberRecords;
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabTypes = TestData.getLotteryType();
    _tabController = TabController(
      vsync: this,
      length: _tabTypes.length,
    );
    _getRecord(_tabTypes[0]);
    _tabController.addListener(() {
      _getRecord(_tabTypes[_tabController.index]);
    });
  }

  void _getRecord(Menu item) {
    List<NumberRecord> _data = TestData.getNumberRecords(item.id);
    ViewBasicResponse response = ViewBasicResponse();
    response.data = _data;
    upDate(response);
  }

  @override
  void upDate(ViewBasicResponse p) {
    setState(() {
      _numberRecords = p.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APPStyle.themeColor,
      appBar: AppBar(
        title: Text(
          '行情',
        ),
        bottom: TabBar(
          tabs: _buildTabs(),
          indicatorColor: APPStyle.heightLightGreen,
          controller: _tabController,
          isScrollable: false,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _buildTabViews(),
      ),
    );
  }

  List<Widget> _buildTabs() => _tabTypes
      .map((item) => Tab(
            text: item.name,
            icon: Image.asset(
              'assets/images/${item.icon}.png',
              height: 24,
              width: 24,
            ),
          ))
      .toList();

  List<Widget> _buildTabViews() => _tabTypes
      .map((item) => ListView.builder(
            itemCount: _numberRecords.length,
            itemBuilder: (BuildContext context, int i) => _buildItem(index: i),
          ))
      .toList();

  Widget _buildItem({int index}) => Container(
        color: index == null
            ? Color(0xFFF2F2F2)
            : index % 2 == 0 ? Color(0xFFFFFFFF) : Color(0xFFF2F2F2),
        padding: EdgeInsets.only(
          left: 32,
          top: 16,
          right: 32,
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              index == null ? '期号' : '${_numberRecords[index].code}',
            ),
            Text(
              index == null ? '开奖号码' : '${_numberRecords[index].number}',
            ),
          ],
        ),
      );
}
