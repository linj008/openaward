import 'package:opening_award/src/common/base_data.dart';

class HomeData extends ViewBasicData{
  String title;
  List<String> banners;
  List<String> notices;
}

class LotteryData extends ViewBasicData{
  int id;
  String name;
  String image;
}

class LotteryRequestData extends ViewBasicData{
  int lotteryId;
}

class TabTitle {
  String title;
  var widget;
  TabTitle(String title,var widget){
    this.title = title;
    this.widget = widget;
  }
}
