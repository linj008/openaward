import 'dart:convert';
import 'model/trade_record.dart';
import 'test_json.dart';

class TestData {
  static List<TradeRecord> _homeDatas;
  static List<TradeRecord> _recordInsideDatas;
  static List<TradeRecord> _recordOutsideDatas;
  static List<TradeRecord> _recordAgentDatas;
  static List<TradeRecord> _recordOrderDatas;

  static List<TradeRecord> _$datas(String testJson) {
    List<TradeRecord> list = List();
    List listJson = json.decode(testJson);
    list = listJson.map((i) => TradeRecord.fromJson(i)).toList();
    return list;
  }

  static List<TradeRecord> _$testData(
      List<TradeRecord> list, TradeRecord item) {
    if (list != null) return list;
    list = List();
    String _name = item.name;
    for (int i = 0; i < 30; i++) {
      TradeRecord _item = item;
      _item.name = '$_name$i';
      list.add(_item);
    }
    return list;
  }

  /// 首页测试数据
  static List<TradeRecord> getHomeData() =>
      _homeDatas ??= _$datas(TestJson.homeJson);

  /// 记录-inside
  static List<TradeRecord> getRecordInsideData() =>
      _$testData(_recordInsideDatas, _$datas(TestJson.recordInside)[0]);

  /// 记录-outside
  static List<TradeRecord> getRecordOutsideData() =>
      _$testData(_recordOutsideDatas, _$datas(TestJson.recordOutside)[0]);

  /// 记录-agent
  static List<TradeRecord> getRecordAgentData() =>
      _$testData(_recordAgentDatas, _$datas(TestJson.recordAgent)[0]);

  /// 记录-agent
  static List<TradeRecord> getRecordOrderData() =>
      _$testData(_recordOrderDatas, _$datas(TestJson.recordOrder)[0]);
}
