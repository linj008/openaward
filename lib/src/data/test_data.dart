import 'dart:convert';
import 'package:opening_award/src/data/model/banner.dart';

import 'model/menu.dart';
import 'model/number_record.dart';
import 'model/show_data.dart';
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

  /// HOME-BANNER
  static List<BannerData> getHomeBannerData() {
    List<BannerData> _homeBannerDatas = List();
    List listJson = json.decode(TestJson.homeBanner);
    _homeBannerDatas = listJson.map((i) => BannerData.fromJson(i)).toList();
    return _homeBannerDatas;
  }

  /// HOME-NOTICE
  static List<BannerData> getHomeNoticeData() {
    List<BannerData> _homeNoticeDatas = List();
    List listJson = json.decode(TestJson.homeNotice);
    _homeNoticeDatas = listJson.map((i) => BannerData.fromJson(i)).toList();
    return _homeNoticeDatas;
  }

  /// HOME-SHOW
  static List<ShowData> getHomeShowData() {
    List<ShowData> _homeShowDatas = List();
    List listJson = json.decode(TestJson.homeShow);
    _homeShowDatas = listJson.map((i) => ShowData.fromJson(i)).toList();
    return _homeShowDatas;
  }

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

  /// 行情-类型
  static List<Menu> getLotteryType() {
    List<Menu> _lotteryTypes = List();
    List listJson = json.decode(TestJson.lotteryType);
    _lotteryTypes = listJson.map((i) => Menu.fromJson(i)).toList();
    return _lotteryTypes;
  }

  /// 行情-开奖记录
  static List<NumberRecord> getNumberRecords(int id) {
    List<NumberRecord> _numberRecords = List();
    List listJson = json.decode(TestJson.numberRecord);
    _numberRecords = listJson.map((i) => NumberRecord.fromJson(i)).toList();
    _numberRecords.map((item) => item.code = '${item.code}$id').toList();
    return _numberRecords;
  }

  /// 彩种
  static List<Menu> getLotteries() {
    List<Menu> _lotteries = List();
    List listJson = json.decode(TestJson.lotterys);
    _lotteries = listJson.map((i) => Menu.fromJson(i)).toList();
    _lotteries
        .map((item) =>
            item.children.map((child) => child.check = false).toList())
        .toList();
    return _lotteries;
  }
}
