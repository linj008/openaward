import 'dart:convert';
import 'package:opening_award/src/data/model/banner.dart';

import 'model/menu.dart';
import 'model/number_record.dart';
import 'model/show_data.dart';
import 'model/trade_record.dart';
import 'test_json.dart';

class TestData {
  static List<TradeRecord> _homeDatas;
  static List<BannerData> _homeBannerDatas;
  static List<BannerData> _homeNoticeDatas;
  static List<ShowData> _homeShowDatas;
  static List<TradeRecord> _recordInsideDatas;
  static List<TradeRecord> _recordOutsideDatas;
  static List<TradeRecord> _recordAgentDatas;
  static List<TradeRecord> _recordOrderDatas;
  static List<Menu> _lotteryTypes;

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
    if (_homeBannerDatas != null) return _homeBannerDatas;
    List<BannerData> list = List();
    List listJson = json.decode(TestJson.homeBanner);
    list = listJson.map((i) => BannerData.fromJson(i)).toList();
    _homeBannerDatas = list;
    return _homeBannerDatas;
  }

  /// HOME-NOTICE
  static List<BannerData> getHomeNoticeData() {
    if (_homeNoticeDatas != null) return _homeNoticeDatas;
    List<BannerData> list = List();
    List listJson = json.decode(TestJson.homeNotice);
    list = listJson.map((i) => BannerData.fromJson(i)).toList();
    _homeNoticeDatas = list;
    return _homeNoticeDatas;
  }

  /// HOME-SHOW
  static List<ShowData> getHomeShowData() {
    if (_homeShowDatas != null) return _homeShowDatas;
    List<ShowData> list = List();
    List listJson = json.decode(TestJson.homeShow);
    list = listJson.map((i) => ShowData.fromJson(i)).toList();
    _homeShowDatas = list;
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
    if (_lotteryTypes != null) return _lotteryTypes;
    _lotteryTypes = List();
    List listJson = json.decode(TestJson.lotteryType);
    _lotteryTypes = listJson.map((i) => Menu.fromJson(i)).toList();
    return _lotteryTypes;
  }

  /// 行情-开奖记录
  static List<NumberRecord> getNumberRecords(int id) {
    List<NumberRecord> _numberRecords = List();
    List listJson = json.decode(TestJson.numberRecord);
    _numberRecords = listJson.map((i) => NumberRecord.fromJson(i)).toList();
    _numberRecords.forEach((item) {
      item.code = '${item.code}$id';
    });
    return _numberRecords;
  }

  /// 彩种
  static List<Menu> getLotteries() {
    List<Menu> _lotteries = List();
    List listJson = json.decode(TestJson.lotterys);
    _lotteries = listJson.map((i) => Menu.fromJson(i)).toList();
    return _lotteries;
  }
}
