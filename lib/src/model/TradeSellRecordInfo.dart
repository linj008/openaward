class TradeSellRecordInfo{
  int totalCount;
  List<TradeSellRecordItem> sellRecordList = [];
}

class TradeSellRecordItem {
  String name;
  double prize;
  String info;
  double count;
  double minLimit;
  double maxLimit;
  int type;
}