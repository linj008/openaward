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

  @override
  void initState() {
    super.initState();
    this._datas = TestData.getHomeData();
    this._bannerDatas = TestData.getHomeBannerData();
    this._showDatas = TestData.getHomeShowData();
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
          Column(children: <Widget>[
            Container(color: Color(0xfff8f8f8), height: 8),
            Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text('doing',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
            Container(color: Color(0xfff8f8f8), height: 8)
          ]),
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

  Color _$color(bool isPlus) =>
      isPlus ? APPStyle.heightLightGreen : APPStyle.heightLightRed;

  @override
  void upDate(ViewBasicResponse p) {}
}
