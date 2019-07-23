import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
import 'package:opening_award/src/data/model/trade_record.dart';
import 'package:opening_award/src/data/test_data.dart';
import 'package:opening_award/src/views/widget/trade_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'home_data.dart';
import 'noticeVec_animation_wedgit.dart';

class HomePage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseWidgetState<ViewBasicResponse, HomePage>
    with SingleTickerProviderStateMixin {
  HomeData _homeData;
  List<Image> banners = new List();
  List<String> notices = ["测试测试测试测试", "测试测试测试", "测试测试", "测试测试测试测试测试"];
  TabController mController;
  List<TabTitle> tabList = new List();
  List<TradeRecord> _datas;

  @override
  void initState() {
    super.initState();
    this._datas = TestData.getHomeData();
    getServerData('HomePage');
    addBanner();
  }

  void addBanner() {
    banners
      ..add(Image.asset(
        'assets/images/sbty.png',
        fit: BoxFit.fill,
      ))
      ..add(Image.asset(
        'assets/images/sjqp.png',
        fit: BoxFit.fill,
      ))
      ..add(Image.asset(
        'assets/images/sjsx.png',
        fit: BoxFit.fill,
      ));
  }

  void getServerData(String key) {
    ViewBasicRequest request = new ViewBasicRequest();
    request.key = key;
    request.type = ViewRequestType.eViewRequestTypeServer;
    request.context = this.context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Bituex'), actions: <Widget>[
          InkWell(
              onTap: () {},
              child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 16),
                  child: Image.asset("assets/images/ic_scan.png"))),
          InkWell(
              onTap: () {},
              child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 16),
                  child: Image.asset("assets/images/ic_get_money.png")))
        ]),
        body: ListView(children: <Widget>[
          swiperView(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: SizedBox(
                    width: 30,
                    height: 24,
                    child: Image.asset(
                      'assets/images/notice.png',
                    )),
              ),
              Expanded(
                child: buildNoticeVec(),
              )
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _datas.length,
              itemBuilder: (BuildContext context, int index) {
                return TradeItem(item: _datas[index]);
              })
        ]));
  }

  Padding buildNoticeVec() {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 16),
      child: NoticeVecAnimation(
        messages: notices,
      ),
    );
  }

  Widget swiperView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 375 * 150,
      child: Swiper(
        itemCount: banners == null ? 0 : banners.length,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.black12)),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
//    Image image = Image.network(
//      banners[index],
//      fit: BoxFit.fill,
//    );
//    image = Image.asset(
//      'assets/images/CQSSC.png',
//      package: 'app_flutter_view_home',
//      fit: BoxFit.fill,
//    );
    return banners[index];
  }

  @override
  void upDate(ViewBasicResponse p) {
    setState(() {});
  }
}
