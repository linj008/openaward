import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';

class TradePage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return new _TradePageState();
  }
}

class _TradePageState extends BaseWidgetState<ViewBasicResponse, TradePage>
    with SingleTickerProviderStateMixin {
  List<Widget> _textList;
  TabController _tabController;

  List<String> moneys = ['5', '10', '50', '100', '自定义'];
  List<String> moneyTemps = ['5', '10', '50', '100', '自定义'];

  int i = 0;

  @override
  void initState() {
    super.initState();
    _textList = [];
    ['买入', '卖出'].forEach((item) {
      _textList.add(Tab(
          child: Text(item,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center)));
    });
    _tabController = TabController(vsync: this, length: _textList.length);
    _tabController.addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void upDate(ViewBasicResponse p) {
    // TODO: implement upDate
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "币币交易",
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: APPStyle.themeColor,
        ),
        body: Container(
            width: double.infinity,
            color: Color(0xffffffff),
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              Text("BTC/USDT", style: TextStyle(fontSize: 18)),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 0;
                                      });
                                    },
                                    child: getBuyTabView(i),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 1;
                                      });
                                    },
                                    child: getSellTabView(i),
                                  ),
                                ),
                              ],
                            ),
                            _getView(i),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            Text("BTC/USDT", style: TextStyle(fontSize: 18)),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 0;
                                      });
                                    },
                                    child: Text("买入"),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 1;
                                      });
                                    },
                                    child: Text("卖出"),
                                  ),
                                )
                              ],
                            ),
                            _getView(i),
                          ]))
                    ],
                  ),
                )
              ],
            )));
  }

  Widget buildBuy() {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text("限价买入",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 40,
                    child: OutlineButton(
                      onPressed: () {},
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: APPStyle.minTextColors,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2))),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 37,
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Color(0xFFDEDEDE), width: 1), // 边色与边宽度
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Color(0xFFFFFFFF)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 40,
                      child: OutlineButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 14),
                        ),
                        textColor: APPStyle.minTextColors,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2),
                              bottomRight: Radius.circular(2)),
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              children: <Widget>[
                Text("估值", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("  72861",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(
                      color: Color(0xFFDEDEDE), width: 1), // 边色与边宽度
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child:
                            Text("  数量", style: TextStyle(color: Colors.grey))),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: 30,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor: Color(0xFFFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child:
                            Text("BTC  ", style: TextStyle(color: Colors.grey)))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              /*child: Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, childAspectRatio: 1 / 0.72),
                  itemCount: moneys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _moneyItem(index, context);
                  },
                ),
              ),*/
              child: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "25%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "50%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "75%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "100%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5), child: Row(
              children: <Widget>[
                Text("可用", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("  0.0 USDT",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),),
            Padding(padding: EdgeInsets.only(top: 5), child: Row(
              children: <Widget>[
                Text("可买", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("  0.000000 BTC",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(children: <Widget>[
                Expanded(child: FlatButton(
                  onPressed: () {},
                  color: APPStyle.heightLightGreen,
                  child: Text(
                    "买入BTC",
                    style:
                    new TextStyle(fontSize: 13, color: APPStyle.themeColor),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),)
              ],),
            )
          ],
        ),
        color: Color(0xFFFFFFFF));
  }

  Widget buildSell() {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text("限价卖出",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 40,
                    child: OutlineButton(
                      onPressed: () {},
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: APPStyle.minTextColors,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2))),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 37,
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Color(0xFFDEDEDE), width: 1), // 边色与边宽度
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.only(top: 8, bottom: 8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Color(0xFFFFFFFF)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 40,
                      child: OutlineButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 14),
                        ),
                        textColor: APPStyle.minTextColors,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2),
                              bottomRight: Radius.circular(2)),
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              children: <Widget>[
                Text("估值", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("  72861",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: new Border.all(
                      color: Color(0xFFDEDEDE), width: 1), // 边色与边宽度
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child:
                        Text("  数量", style: TextStyle(color: Colors.grey))),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: 30,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(0),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor: Color(0xFFFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child:
                        Text("BTC  ", style: TextStyle(color: Colors.grey)))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "25%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "50%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "75%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: new FlatButton(
                        onPressed: () {},
                        color: Color(0xFFF5F7F9),
                        child: Text(
                          "100%",
                          style: new TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5), child: Row(
              children: <Widget>[
                Text("可用", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("  0.0 USDT",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),),
            Padding(padding: EdgeInsets.only(top: 5), child: Row(
              children: <Widget>[
                Text("可买", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("  0.000000 BTC",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(children: <Widget>[
                Expanded(child: FlatButton(
                  onPressed: () {},
                  color: APPStyle.heightLightRed,
                  child: Text(
                    "卖出BTC",
                    style:
                    new TextStyle(fontSize: 13, color: APPStyle.themeColor),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),)
              ],),
            )
          ],
        ),
        color: Color(0xFFFFFFFF));
  }

  Widget _getView(int i) {
    if (i == 0) {
      return buildBuy();
    } else {
      return buildSell();
    }
  }

  Widget getBuyTabView(int i) {
    Color bgColor;
    Color textColor;
    if (i == 0) {
      bgColor = APPStyle.heightLightGreen;
      textColor = APPStyle.themeTextColor;
    } else {
      bgColor = Color(0xFFF8F8F8);
      textColor = Color(0xFFB5B5B5);
    }

    return Container(
      height: 25,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.zero,
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.zero),
      ),
      alignment: Alignment.center,
      child: Text(
        "买入",
        style: TextStyle(fontSize: 14, color: textColor),
      ),
    );
  }

  Widget getSellTabView(int i) {
    Color bgColor;
    Color textColor;
    if (i == 0) {
      bgColor = Color(0xFFF8F8F8);
      textColor = Color(0xFFB5B5B5);
    } else {
      bgColor = APPStyle.heightLightRed;
      textColor = APPStyle.themeTextColor;
    }

    return Container(
      height: 25,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(5.0)),
      ),
      alignment: Alignment.center,
      child: Text(
        "卖出",
        style: TextStyle(fontSize: 14, color: textColor),
      ),
    );
  }
}
