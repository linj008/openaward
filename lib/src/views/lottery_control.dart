import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';
import 'package:opening_award/src/data/model/menu.dart';
import 'package:opening_award/src/data/test_data.dart';

/// 彩种控制
// ignore: must_be_immutable
class LotteryControlPage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return LotteryControlState();
  }
}

class LotteryControlState
    extends BaseWidgetState<ViewBasicResponse, LotteryControlPage> {
  List<Menu> _lotteries;

  @override
  void upDate(ViewBasicResponse p) {}

  @override
  void initState() {
    super.initState();
    this._lotteries = TestData.getLotteries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: S.bgColor,
      appBar: AppBar(
        backgroundColor: S.themeColor,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        title: Text(
          '彩种控制',
          style: TextStyle(
            color: S.textWhite,
          ),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _lotteries.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildListItem(_lotteries[index]);
          }),
    );
  }

  Widget _buildListItem(Menu menu) {
    return Column(
      children: <Widget>[
        Container(
          color: S.secondColor,
          height: 50,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              Image.asset(
                P.png(menu.icon),
                height: 24,
                width: 24,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
              ),
              Text(
                menu.name,
                style: TextStyle(
                  color: S.textBlack,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: menu.children.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildChildrenItem(menu.children[index]);
            }),
      ],
    );
  }

  Widget _buildChildrenItem(Menu menu) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: menu.check,
                activeColor: S.themeColor,
                onChanged: (bool val) {
                  setState(() {
                    menu.check = val;
                  });
                },
              ),
              Text(
                menu.name,
                style: TextStyle(
                  color: S.textBlack,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Divider(height: 1),
        ),
      ],
    );
  }
}
