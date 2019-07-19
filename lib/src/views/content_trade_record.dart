import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

import '../common/app_style.dart';
import '../common/base_data.dart';
import '../common/weight/base_stateful_widget.dart';

class TradeRecordPage extends BaseStatefulWidget {
//  EventBus eventBus = new EventBus();

  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return _TradeRecordPageState();
  }
}

class _TradeRecordPageState
    extends BaseWidgetState<ViewBasicResponse, TradeRecordPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  List<Widget> _textList;
  String startDate = DateTime.now().toString().split(" ").first;
  String endDate =
      DateTime.now().add(Duration(days: 1)).toString().split(" ").first;
  int curPage = 1; //当前页
  int count = 30;
  List betsList; //投注记录
  int currentStatus; //当前查询状态
  String pickerValue = "所有彩种";

  List _list;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    betsList = [];
    _textList = [];
    _list = [];

    List textList = ['购买', '出售', '委托单', '订单'];
    textList.forEach((item) {
      _textList.add(Tab(
        child: Text(
          item,
          style: TextStyle(color: Colors.black, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ));
    });

    getRecord();

    _tabController = new TabController(vsync: this, length: _textList.length);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        getRecord();
      } else {
        currentStatus = _tabController.index - 1;
        getRecord();
      }
    });
  }

  void getRecord() {
    /*ViewBasicRequest request = new ViewBasicRequest();
    request.key = "QueryUserBetsList";
    request.type = ViewRequestType.eViewRequestTypeServer;
    request.context = context;
    ProtocalBetRecordReq recordReq = new ProtocalBetRecordReq(
        curPage, null, count, startDate, endDate, null, lotteryId, currentStatus);
    request.data = recordReq;
    widget.eventBus.fire(request);*/
  }

  Container subBetDetailContainer(
      String mainText, Color mainTextColor, String subText, subTextColor) {
    return new Container(
      padding: EdgeInsets.only(bottom: 2),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Text(
              mainText,
              style: new TextStyle(fontSize: 11, color: mainTextColor),
            ),
          ),
          new Expanded(
            child: new Text(
              subText,
              style: new TextStyle(fontSize: 11, color: subTextColor),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector betDetailContainer(int i) {
    return GestureDetector(
        onTap: () {
          /*ViewBasicRequest request = new ViewBasicRequest();
          request.context = context;
          request.key = "BetDetail";
          request.type = ViewRequestType.eViewRequestTypeView;
          ViewToViewData toViewData = new ViewToViewData();
          toViewData.data = "?billId=" + betsList[i].detail.ID.toString();
          request.data = toViewData;
          widget.eventBus.fire(request);*/
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: new Column(
            children: <Widget>[
              new Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        '6.95  CNY',
                        style: new TextStyle(fontSize: 11, color: APPStyle.heightLightColor),
                      )
                    ],
                  )),
              Divider(),
              subBetDetailContainer(
                "操作: " ,
                Colors.grey,
                "期号: ",
                Colors.grey,
              ),
              subBetDetailContainer(
                "投注时间: ",
                Colors.grey,
                "游戏玩法: ",
                Colors.grey,
              )
            ],
          ),
        ));
  }

  void chooseDate(DateTime time, int i) {
    if (i == 0) {
      startDate = time.toString().split(" ").first;
    } else {
      endDate = time.toString().split(" ").first;
    }

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 30)), //减 30 天
      lastDate: DateTime.now().add(Duration(days: 30)), // 加 30 天
    ).then((DateTime val) {
      if (val == null) {
        return;
      }
      setState(() {
        if (i == 0) {
          startDate = val.toString().split(" ").first;
        } else {
          endDate = val.toString().split(" ").first;
        }
      });

      getRecord();

    }).catchError((err) {
      print(err);
    });
  }

  GestureDetector datePickStack(DateTime time, int i) {
    return new GestureDetector(
        onTap: () {
          chooseDate(time, i);
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(3))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(i == 0 ? startDate : endDate, style: new TextStyle(fontSize: 12,
              ),
              ),
              //Image.asset('assets/images/date_arrow.png', width: 15 * 0.7, height: 10 * 0.7,),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    var scaffold = Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  /*ViewBasicRequest request = new ViewBasicRequest();
                  request.type = ViewRequestType.eViewRequestTypeBack;
                  request.key = "BetRecordPageBack";
                  request.context = context;
                  widget.eventBus.fire(request);*/
                }),
            title: Text("法币交易"),
            centerTitle: true,
            backgroundColor: APPStyle.themeColor),
        body: new Container(
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  /*new Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: datePickStack(now, 0),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: new Text(
                            '至',
                            style: new TextStyle(fontSize: 12),
                          ),
                        ),

                        Expanded(
                          child: datePickStack(now.add(Duration(days: 1)), 1),
                        ),

                        Expanded(
                            child: GestureDetector(
                              onTap: (){
                                //showPicker(context, lotteryList);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.all(Radius.circular(3))),
                                height: 35,
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(pickerValue),
                                    //Image.asset('assets/images/date_arrow.png', width: 15 * 0.7, height: 10 * 0.7,),
                                  ],
                                ),
                              ),
                            )
                        ),



                      ],
                    ),
                  ),*/


                  Container(
                    color: Colors.white,
                    child: new TabBar(
                      tabs: _textList,
                      indicatorColor: APPStyle.heightLightColor,
                      controller: _tabController,
                    ),
                  ),


                  Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          buildListView(),
                          buildListView(),
                          buildListView(),
                          buildListView(),
                        ],
                      ))
                ])));
    return scaffold;
  }

  @override
  void upDate(ViewBasicResponse p) {
    /*if (p.data == null) {
      return;
    }

    if (p.data is List<GameLottery>) {
      List<GameLottery> info = p.data;
      setState(() {
        for (int i = 0; i < info.length; i++) {
          lotteryList.add(info[i].showName);
          lotteryIdList.add(info[i].id);
        }
      });
    }

    if (p.data is ReportBetRecordInfo) {
      _list.clear();
      ReportBetRecordInfo info = p.data;
      _list = info.betsList;
      setState(() {
        for (int i = 0; i < info.betsList.length; i++) {
          betsList.add(info.betsList[i]);
        }
      });
    }*/
  }

  Widget buildListView() {
    return LoadMore(
      isFinish: _list.length == 0 ? true : false,
      child: ListView.builder(
          itemCount: betsList.length,
          itemBuilder: (BuildContext context, int i) {
            return betDetailContainer(i);
          }),
      onLoadMore: _loadMore,
    );
  }

  Future<bool> _loadMore() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    curPage++;
    getRecord();
    return true;
  }

  /*showPicker(BuildContext context, List list) {
    Picker picker = new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: list),
        changeToFirst: true,
        textAlign: TextAlign.left,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(picker.getSelectedValues()[0]);
          setState(() {
            pickerValue = picker.getSelectedValues()[0];
          });
          lotteryId = lotteryIdList[int.parse(value.toString()[1])];
          getBetRecord();

        });
    picker.show(_scaffoldKey.currentState);
  }*/
}
