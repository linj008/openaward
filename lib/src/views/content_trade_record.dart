import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:opening_award/src/data/model/trade_record.dart';
import 'package:opening_award/src/data/test_data.dart';

import '../common/app_style.dart';
import '../common/base_data.dart';
import '../common/weight/base_stateful_widget.dart';
import 'widget/trade_item.dart';

// ignore: must_be_immutable
class TradeRecordPage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return _TradeRecordPageState();
  }
}

class _TradeRecordPageState
    extends BaseWidgetState<ViewBasicResponse, TradeRecordPage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  List<Widget> _textList;
  int curPage = 1; //当前页

  List<TradeRecord> _insideDatas = List();
  List<TradeRecord> _outsideDatas = List();
  List<TradeRecord> _agentDatas = List();
  List<TradeRecord> _orderDatas = List();
  bool _isFinishLoading = true;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _textList = [];
    ['购买', '出售', '委托单', '订单'].forEach((item) {
      _textList.add(Tab(
          child: Text(item,
              style: TextStyle(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.center)));
    });
    getRecord();
    _tabController = TabController(vsync: this, length: _textList.length);
    _tabController.addListener(() {
      index = _tabController.index;
      getRecord();
    });
  }

  void getRecord() {
    List<TradeRecord> _data;
    switch (index) {
      case 0:
        _data = TestData.getRecordInsideData();
        break;
      case 1:
        _data = TestData.getRecordOutsideData();
        break;
      case 2:
        _data = TestData.getRecordAgentData();
        break;
      case 3:
        _data = TestData.getRecordOrderData();
        break;
    }
    ViewBasicResponse response = ViewBasicResponse();
    response.data = _data;
    upDate(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: S.bgColor,
      appBar: AppBar(
        title: Text('法币交易'),
        bottom: TabBar(
          tabs: _textList,
          //indicator: ColorTabIndicator(Colors.black),
          indicatorColor: S.themeColor,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildListView(_insideDatas),
          _buildListView(_outsideDatas),
          buildMyOrderList(),
          _buildListView(_orderDatas),
        ],
      ),
    );
  }

  @override
  void upDate(ViewBasicResponse p) {
    setState(() {
      _isFinishLoading = true;
    });
    switch (index) {
      case 0:
        setState(() {
          _insideDatas.addAll(p.data);
        });
        break;
      case 1:
        setState(() {
          _outsideDatas.addAll(p.data);
        });
        break;
      case 2:
        setState(() {
          _agentDatas.addAll(p.data);
        });
        break;
      case 3:
        setState(() {
          _orderDatas.addAll(p.data);
        });
        break;
    }
  }

  Widget _buildListView(List<TradeRecord> trades) {
    return LoadMore(
        isFinish: _isFinishLoading,
        child: ListView.builder(
            itemCount: trades.length,
            itemBuilder: (BuildContext context, int i) {
              return TradeItem(item: trades[index], tag: TradeTag.record);
            }),
        onLoadMore: _loadMore);
  }

  Widget buildMyOrderList() {
    return Container(
        //alignment:Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(P.png('img_order'), width: 278, height: 202),
            Text('您当前还没有进行任何挂单',
                style: new TextStyle(fontSize: 13, color: Colors.grey)),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: new FlatButton(
                onPressed: () {},
                color: S.themeColor,
                child: Text(
                  '立即挂单',
                  style:
                      new TextStyle(fontSize: 13, color: APPStyle.themeColor),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            )
          ],
        ),
        color: S.secondColor);
  }

  Future<bool> _loadMore() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    setState(() {
      _isFinishLoading = false;
    });
    curPage++;
    getRecord();
    return true;
  }
}
