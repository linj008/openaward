
import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
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
  List<String> notices = ["测试测试测试测试","测试测试测试","测试测试","测试测试测试测试测试"];
  TabController mController;
  List<TabTitle> tabList = new List();

  @override
  void initState() {
    super.initState();
    getServerData('HomePage');
    addBanner();
  }

  void addBanner() {
     banners..add(Image.asset(
      'assets/images/sbty.png',
      fit: BoxFit.fill,
    ))..add(Image.asset(
      'assets/images/sjqp.png',
      fit: BoxFit.fill,
    ))..add(Image.asset(
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
      appBar: AppBar(
        backgroundColor: APPStyle.themeColor,
        leading: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "   ",//退出
                  textAlign: TextAlign.center,
                ),
              ),
            )),
        title: new Text("WM GAMING",style: TextStyle(color: Colors.white,fontSize: 18),),
        centerTitle: true,
      ),
      body: ListView(
          children: <Widget>[
            swiperView(),
            Row(children: <Widget>[Padding(padding: EdgeInsets.only(left: 10,),child: SizedBox(
                width: 30,
                height: 24,
                child: Image.asset(
                  'assets/images/notice.png',
                )
            ),),Expanded(child: buildNoticeVec(),)],),
          ]),
    );
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
    setState(() {

    });
  }


}
