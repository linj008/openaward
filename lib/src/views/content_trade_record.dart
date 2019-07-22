import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:opening_award/src/model/TradeBuyRecordInfo.dart';
import 'package:opening_award/src/model/TradeSellRecordInfo.dart';

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
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  List<Widget> _textList;
  String startDate = DateTime.now().toString().split(" ").first;
  String endDate =
      DateTime.now().add(Duration(days: 1)).toString().split(" ").first;
  int curPage = 1; //当前页
  int count = 30;
  List<TradeBuyRecordItem> buyTradesList; //交易记录
  List<TradeSellRecordItem> sellTradesList; //交易记录
  int currentStatus; //当前查询状态
  String pickerValue = "所有彩种";

  List<TradeBuyRecordItem> _listBuy;
  List<TradeSellRecordItem> _listSell;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    buyTradesList = [];
    sellTradesList = [];
    _textList = [];
    _listBuy = [];
    _listSell = [];

    List textList = ['购买', '出售', '委托单', '订单'];
    textList.forEach((item) {
      _textList.add(Tab(
        child: Text(
          item,
          style: TextStyle(color: Colors.black, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ));
    });

    getRecord();

    _tabController = new TabController(vsync: this, length: _textList.length);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        index = _tabController.index;
        getRecord();
      } else {
        index = _tabController.index;
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
    if(index == 0) {
      TradeBuyRecordInfo tradeBuyRecordInfo = new TradeBuyRecordInfo();
      for (int i = 0; i < 10; i ++) {
        TradeBuyRecordItem item = new TradeBuyRecordItem();
        item.name = "CNY";
        item.prize = 6.98;
        item.info = "诚信商家 50单 完成率92.00%";
        item.count = 150;
        item.minLimit = 50.00;
        item.maxLimit = 150.00;
        item.type = index == 0 ? 0 : 1;
        tradeBuyRecordInfo.buyRecordList.add(item);
      }
      ViewBasicResponse response = ViewBasicResponse();
      response.data = tradeBuyRecordInfo;
      upDate(response);
    }else{
      TradeSellRecordInfo tradeSellRecordInfo = new TradeSellRecordInfo();
      for (int i = 0; i < 10; i ++) {
        TradeSellRecordItem item = new TradeSellRecordItem();
        item.name = "CNY";
        item.prize = 6.88;
        item.info = "诚信商家 50单 完成率82.00%";
        item.count = 150;
        item.minLimit = 60.00;
        item.maxLimit = 160.00;
        item.type = index == 0 ? 0 : 1;
        tradeSellRecordInfo.sellRecordList.add(item);
      }
      ViewBasicResponse response = ViewBasicResponse();
      response.data = tradeSellRecordInfo;
      upDate(response);
    }
  }

  Container subBetDetailContainer(
      String mainText, Color mainTextColor, String subText, subTextColor, double bottom, top) {
    Color color = subText == "买入" ? APPStyle.heightLightGreen : APPStyle.heightLightRed;
    return new Container(
      padding: EdgeInsets.only(bottom: bottom, top: top),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Text(
              mainText,
              style: new TextStyle(fontSize: 13, color: mainTextColor),
            ),
          ),
          subText == "买入" || subText == "卖出" ?
          new Container(
              height: 30.0,
          width: 60.0,
          child:
            new FlatButton(
              onPressed: (){},
              color: color,
              child: Text(subText, style: new TextStyle(fontSize: 13, color: APPStyle.themeColor),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            )
          ):
          new Expanded(
            child: new Text(
              subText,
              style: new TextStyle(fontSize: 13, color: subTextColor),
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
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          color: APPStyle.themeColor,
          child: new Column(
            children: <Widget>[

              subBetDetailContainer(

                  index == 0 ? buyTradesList[i].prize.toString() + "   " + buyTradesList[i].name : sellTradesList[i].prize.toString() + "   " + sellTradesList[i].name,
                  index == 0 ? APPStyle.heightLightGreen : APPStyle.heightLightRed,
                  index == 0 ? "买入" : "卖出",
                  Colors.grey,
                  2.00,
                  2.00,
              ),
              Divider(),
              subBetDetailContainer(
                  index == 0 ? buyTradesList[i].info : sellTradesList[i].info ,
                Colors.grey,
                " ",
                Colors.grey,
                6.00,
                5.00
              ),
              subBetDetailContainer(
                "数量: " + (index == 0 ? buyTradesList[i].count.toString() : sellTradesList[i].count.toString()),
                Colors.grey,
                "限额: " + (index == 0 ? buyTradesList[i].minLimit.toString() + "-" + buyTradesList[i].maxLimit.toString() : sellTradesList[i].minLimit.toString() + "-" + sellTradesList[i].maxLimit.toString()),
                Colors.grey,
                  15.00,
                  5.00
              )
            ],
          ),
        ));
  }

  /*void chooseDate(DateTime time, int i) {
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
  }*/

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
                      indicatorColor: APPStyle.heightLightGreen,
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

    if (p.data is TradeBuyRecordInfo) {
      _listBuy.clear();
      List<TradeBuyRecordItem> info = p.data.buyRecordList;
      _listBuy = info;
      setState(() {
        for (int i = 0; i < info.length; i++) {
          buyTradesList.add(info[i]);
        }
      });
    }
    if (p.data is TradeSellRecordInfo) {
      _listSell.clear();
      List<TradeSellRecordItem> info = p.data.sellRecordList;
      _listSell = info;
      setState(() {
        for (int i = 0; i < info.length; i++) {
          sellTradesList.add(info[i]);
        }
      });
    }
  }

  Widget buildListView() {
    if(index == 0) {
      return LoadMore(
        isFinish: _listBuy.length == 0 ? true : false,
        child: ListView.builder(
            itemCount: buyTradesList.length,
            itemBuilder: (BuildContext context, int i) {
              return betDetailContainer(i);
            }),
        onLoadMore: _loadMore,
      );
    }else if(index == 1){
      return LoadMore(
        isFinish: _listSell.length == 0 ? true : false,
        child: ListView.builder(
            itemCount: sellTradesList.length,
            itemBuilder: (BuildContext context, int i) {

              return betDetailContainer(i);
            }),
        onLoadMore: _loadMore,
      );
    }
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
