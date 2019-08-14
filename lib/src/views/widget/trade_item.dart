import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/data/model/trade_record.dart';

// ignore: must_be_immutable
class TradeItem extends StatefulWidget {
  TradeRecord item;
  String tag;

  TradeItem({Key key, this.item, this.tag}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TradeItemState();
}

class TradeItemState extends State<TradeItem> {
  @override
  Widget build(BuildContext context) {
    TradeRecord _item = widget.item;
    if (_item == null) return null;
    final _tag = widget.tag;
    return GestureDetector(
        onTap: () {},
        child: Column(children: <Widget>[
          Container(
              color: S.bgColor,
              padding: EdgeInsets.all(16),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Offstage(
                      offstage: _$offstage(_tag),
                      child:
                          Image.asset(P.jpeg('logo'), height: 14, width: 14)),
                  Offstage(
                      offstage: _$offstage(_tag),
                      child: Text(' ${_item.title} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Expanded(
                      child: Text('${_item.price} CNY',
                          style: TextStyle(
                              color: _$color(_item.type),
                              fontWeight: FontWeight.bold,
                              fontSize: 16))),
                  Container(
                      height: 30.0,
                      width: 60.0,
                      child: FlatButton(
                          onPressed: () {},
                          color: _$color(_item.type),
                          child: Text(_$text(_item.type),
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
                  Image.asset(P.png('pay_alipay'), height: 14, width: 14),
                  Image.asset(P.png('pay_wechat'), height: 14, width: 14),
                  Image.asset(P.png('pay_yinlian'), height: 14, width: 14)
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
          Container(color: S.secondColor, height: 8)
        ]));
  }

  Color _$color(int type) {
    switch (type) {
      case TradeType.inside:
        return APPStyle.heightLightGreen;
      case TradeType.outside:
        return APPStyle.heightLightRed;
      case TradeType.agent:
        return Colors.blueAccent;
      case TradeType.order:
        return Colors.amber;
      default:
        return APPStyle.heightLightGreen;
    }
  }

  String _$text(int type) {
    switch (type) {
      case TradeType.inside:
        return '买入';
      case TradeType.outside:
        return '卖出';
      case TradeType.agent:
        return '委托';
      case TradeType.order:
        return '订单';
      default:
        return '买入';
    }
  }

  bool _$offstage(String tag) {
    switch (tag) {
      case TradeTag.home:
        return false;
      case TradeTag.record:
        return true;
      default:
        return false;
    }
  }
}

class TradeTag {
  /// HOME
  static const String home = 'home';

  /// RECORD
  static const String record = 'record';
}
