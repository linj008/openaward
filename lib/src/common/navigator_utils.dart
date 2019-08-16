import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opening_award/src/views/lottery_control.dart';

class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }

  ///彩种控制
  static goLotteryControlPage(BuildContext context) {
    _$navigatorRouter(context, LotteryControlPage());
  }

  ///返回
  static goBack(BuildContext context) {
    Navigator.pop(context);
  }

  ///公共打开方式
  static _$navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => widget));
  }
}
