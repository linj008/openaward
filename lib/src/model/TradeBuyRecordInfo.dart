class TradeBuyRecordInfo{
  int totalCount;
  List<TradeBuyRecordItem> buyRecordList = [];
}

class TradeBuyRecordItem {
  String name;
  double prize;
  String info;
  double count;
  double minLimit;
  double maxLimit;
  int type;
}