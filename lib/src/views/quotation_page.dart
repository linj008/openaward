
import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';

class QuotationPage extends BaseStatefulWidget {
  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return new _QuotationPageState();
  }
}

class _QuotationPageState extends BaseWidgetState<ViewBasicResponse, QuotationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void upDate(ViewBasicResponse p) {
    // TODO: implement upDate
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("行情",style: TextStyle(color: Colors.white,fontSize: 18),),
        backgroundColor: APPStyle.themeColor,
      ),
      body: Container(child: Text("暂无行情",
        style: TextStyle(color: APPStyle.midTextColors,fontSize: APPStyle.midTextSize),
        textAlign: TextAlign.center,),alignment: Alignment.center,)
    );

  }
}
