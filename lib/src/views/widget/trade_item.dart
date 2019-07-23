import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/data/model/trade_record.dart';

// ignore: must_be_immutable
class TradeItem extends StatefulWidget {
  TradeRecord item;
  String tag;

  TradeItem({Key key, this.item, this.tag = 'home'}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TradeItemState();
}

class TradeItemState extends State<TradeItem> {
  @override
  Widget build(BuildContext context) {
    TradeRecord _item = widget.item;
    final _tag = widget.tag;
    return GestureDetector(
        onTap: () {},
        child: Column(children: <Widget>[
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Offstage(
                      offstage: _offstage(tag: _tag),
                      child: Image.asset('assets/images/logo.jpeg',
                          height: 14, width: 14)),
                  Offstage(
                      offstage: _offstage(tag: _tag),
                      child: Text(' ${_item.title} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Expanded(
                      child: Text('${_item.price} CNY',
                          style: TextStyle(
                              color: _color(_item.type),
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Container(
                      height: 30.0,
                      width: 60.0,
                      child: FlatButton(
                          onPressed: () {},
                          color: _color(_item.type),
                          child: Text(
                              TradeRecord.isInside(_item.type) ? '买入' : '卖出',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))))
                ]),
                Divider(color: Colors.transparent),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          '${_item.name} ${_item.num}单 完成率${_item.percent}%',
                          style: TextStyle(color: Colors.grey, fontSize: 14))),

                  /// 暂时先写死
                  Image.asset('assets/images/pay_alipay.png',
                      height: 14, width: 14),
                  Image.asset('assets/images/pay_wechat.png',
                      height: 14, width: 14),
                  Image.asset('assets/images/pay_yinlian.png',
                      height: 14, width: 14)
                ]),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(fontSize: 14),
                                  children: [
                                    TextSpan(
                                        text: '数量 ',
                                        style: TextStyle(color: Colors.black)),
                                    TextSpan(
                                        text: '${_item.count}',
                                        style: TextStyle(color: Colors.grey))
                                  ]),
                              textDirection: TextDirection.ltr)),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(fontSize: 14),
                              children: [
                                TextSpan(
                                    text: '限额 ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: '${_item.minLimit}-${_item.maxLimit}',
                                    style: TextStyle(color: Colors.grey))
                              ]),
                          textDirection: TextDirection.ltr)
                    ]))
              ])),
          Container(color: Color(0xfff8f8f8), height: 8)
        ]));
  }

  Color _color(int type) {
    return TradeRecord.isInside(type)
        ? APPStyle.heightLightGreen
        : APPStyle.heightLightRed;
  }

  bool _offstage({String tag}) {
    if (tag == null) return true;
    return !(tag == 'home');
  }
}
