import 'dart:convert';
import 'model/trade_record.dart';
import 'test_json.dart';

class TestData {
  static List<TradeRecord> _homeDatas;

  static List<TradeRecord> _$datas(String testJson) {
    List<TradeRecord> list = List();
    List listJson = json.decode(testJson);
    list = listJson.map((i) => TradeRecord.fromJson(i)).toList();
    return list;
  }

  /// 首页测试数据
  static List<TradeRecord> getHomeData() =>
      _homeDatas ??= _$datas(TestJson.homeJson);
}
