import 'package:flutter/material.dart';

import '../app_style.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseWidgetState baseWidgetState;

  BaseStatefulWidget({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    baseWidgetState = getState();
    return baseWidgetState;
  }

  BaseWidgetState getState();
  String getStateName() {
//    return baseWidgetState.getClassName();
  }

}

abstract class BaseWidgetState<ViewBasicResponse,T extends BaseStatefulWidget> extends State<T> {

  @override
  void initState() {
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  void upDate(ViewBasicResponse p);

  Widget getLoadingWidget() {
    return Container(
      //错误页面中心可以自己调整
      padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
      color: Colors.black12,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child:
        // 圆形进度条
        new CircularProgressIndicator(
          strokeWidth: 4.0,
          backgroundColor: Colors.blue,
          // value: 0.2,
          valueColor: new AlwaysStoppedAnimation<Color>(APPStyle.themeColor),
        ),
      ),
    );
  }

}

