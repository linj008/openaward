import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
import 'package:opening_award/src/data/model/banner.dart';
import 'package:opening_award/src/data/model/show_data.dart';
import 'package:opening_award/src/data/model/trade_record.dart';
import 'package:opening_award/src/data/test_data.dart';
import 'package:opening_award/src/views/widget/trade_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'noticeVec_animation_wedgit.dart';

// ignore: must_be_immutable
class HomePage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseWidgetState<ViewBasicResponse, HomePage>
    with SingleTickerProviderStateMixin {
  List<TradeRecord> _datas;
  List<BannerData> _bannerDatas;
  List<ShowData> _showDatas;
  List<BannerData> _noticeDatas;

  @override
  void initState() {
    super.initState();
    this._datas = TestData.getHomeData();
    this._bannerDatas = TestData.getHomeBannerData();
    this._showDatas = TestData.getHomeShowData();
    this._noticeDatas = TestData.getHomeNoticeData();
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
                  child: Image.asset('assets/images/ic_scan.png'))),
          InkWell(
              onTap: () {},
              child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 16),
                  child: Image.asset('assets/images/ic_get_money.png')))
        ]),
        body: ListView(children: <Widget>[
          Container(
            height: 180,
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Swiper(
                pagination: SwiperPagination(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.black54, activeColor: Colors.black12)),
                controller: SwiperController(),
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => print('点击了第$index'),
                itemCount: _bannerDatas.length,
                itemBuilder: (BuildContext context, int index) {
                  return _builderSwiper(_bannerDatas[index]);
                }),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _showDatas.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildGridItem(_showDatas[index]);
              }),
          _buildNotice(),
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

  Widget _builderSwiper(BannerData banner) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/logo.jpeg',
            image: banner.picUrl,
            fit: BoxFit.fill));
  }

  Widget _buildGridItem(ShowData showData) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(showData.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          Text(showData.point.toString(),
              style: TextStyle(
                  color: _$color(showData.isPlus),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('${showData.isPlus ? '+' : '-'}${showData.percent}%',
              style: TextStyle(color: _$color(showData.isPlus), fontSize: 14)),
          Text('${showData.money} CNY',
              style: TextStyle(color: Colors.grey, fontSize: 14))
        ]);
  }

  Widget _buildNotice() {
    return Column(children: <Widget>[
      Container(color: Color(0xfff8f8f8), height: 8),
      Container(
          padding: EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(children: <Widget>[
                  Text('最新资讯: ',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Expanded(child: NoticeVecAnimation(notices: _noticeDatas))
                ])),
            Row(children: <Widget>[
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff8f8f8),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(right: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('EOS定投专区',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Container(
                                margin: EdgeInsets.only(top: 8, bottom: 8),
                                child: Text('长期稳定高收益',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12))),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 8, top: 2, right: 8, bottom: 2),
                                decoration: BoxDecoration(
                                    color: Color(0xffFF585C),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text('热门服务',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)))
                          ]))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.only(
                            left: 32, top: 8, right: 32, bottom: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/ic_gift.png',
                                  height: 18, width: 18),
                              Text('    邀请好友',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14))
                            ])),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.only(
                            left: 32, top: 8, right: 32, bottom: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/ic_help.png',
                                  height: 18, width: 18),
                              Text('    帮助中心',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14))
                            ]))
                  ])
            ])
          ])),
      Container(color: Color(0xfff8f8f8), height: 8)
    ]);
  }

  Color _$color(bool isPlus) =>
      isPlus ? APPStyle.heightLightGreen : APPStyle.heightLightRed;

  @override
  void upDate(ViewBasicResponse p) {}
}
