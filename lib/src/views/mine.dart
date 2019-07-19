import 'package:flutter/material.dart';
import 'package:opening_award/src/common/app_style.dart';
import 'package:opening_award/src/common/base_data.dart';
import 'package:opening_award/src/common/weight/base_stateful_widget.dart';

class MinePage extends BaseStatefulWidget {


  @override
  BaseWidgetState<ViewBasicResponse, BaseStatefulWidget> getState() {
    return MineState();
  }
}

class MineState extends BaseWidgetState<ViewBasicResponse, MinePage> {
  String _userName = "测试姓名";
  String _lotteryMoney = "测试金额";
  bool isShow = true;
  bool isMute = true;
  bool isNotice =true;
  bool isRapid = true;

  @override
  void upDate(ViewBasicResponse p) {

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APPStyle.themeColor,
        centerTitle: true,
        title: Text("我的账户"),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: <Widget>[
                  //Image.asset("assets/images/icon_customer_service.png", height: 25, width: 25,),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child:Text("客服",),
                  )
                ],
              ),
            ),
      )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              //个人信息部分
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/icon_logo.png", height: 70, width: 70,),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("账户:  " + _userName, style: TextStyle(color: Colors.black, fontSize: 16),),
                          Row(
                            children: <Widget>[
                              Text("余额:  " + (isShow ? _lotteryMoney : "******"), style: TextStyle(color: Colors.black, fontSize: 16),),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isShow) {
                                        isShow = false;
                                      } else {
                                        isShow = true;
                                      }
                                    });
                                  },
                                  child: _buildImage(),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(child: _buildColumnButton("assets/images/icon_recharge_record.png", "充值")),
                    Expanded(child: _buildColumnButton("assets/images/icon_withdraw_record.png", "提现")),
                    Expanded(child: _buildColumnButton("assets/images/icon_trading_record.png", "交易记录")),
                    Expanded(child: _buildColumnButton("assets/images/icon_bet_record.png", "投注记录")),
                  ],
                ),
              ),

              _buildListItem("assets/images/icon_user.png","个人中心"),
              _buildListItem("assets/images/icon_safety.png","安全中心"),
              _buildListItem("assets/images/icon_agency.png","代理中心")
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildColumnButton(String image, String text) {
    return GestureDetector(
      onTap: (){


      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Image.asset(image, height: 40,width: 40,),
            Container(
              margin: EdgeInsets.only(top: 5),
              child:Text(text, style: TextStyle(color: Colors.black, fontSize: 16),) ,
            )
          ],
        ),
      ),
    );
  }

  Image _buildImage() {
    if (isShow) {
      return Image.asset("assets/images/icon_display.png",  height: 20, width: 20,);
    } else {
      return Image.asset("assets/images/icon_hide.png",  height: 20, width: 20,
      );
    }
  }

  Widget _buildListItem(String image,String text){

    return InkWell(
      onTap: (){
        ViewBasicRequest request = new ViewBasicRequest();

      },
      child:Container(
        padding: EdgeInsets.only(left: 15,right: 15),
        height: 50,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(image,height: 25,width: 25,),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Text(text,style: TextStyle(color: Colors.black,fontSize: 16),),
                )
              ],
            ),
            Image.asset("assets/images/icon_right.png",height: 15,width: 15,),
          ],
        ),

      ),
    );
  }



  Widget _buildCheckItem(String image,String text,int i){
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(image,height: 25,width: 25,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child:Text(text,style: TextStyle(color: Colors.black,fontSize: 16),),
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                switch(i){
                  case 0:
                    if(isMute){
                      isMute = false;
                    }else{
                      isMute = true;
                    }
                    break;
                  case 1:
                    if(isNotice){
                      isNotice = false;
                    }else{
                      isNotice = true;
                    }
                    break;
                  case 2:
                    if(isRapid){
                      isRapid = false;
                    }else{
                      isRapid = true;
                    }
                    break;
                }
              });
            },
          child:_buildCheckBox(i),
          )
        ],
      ),
    );
  }

  Image _buildCheckBox(int i) {
    switch(i){
      case 0:
        if (isMute) {
          return Image.asset("assets/images/icon_open.png",  height: 40, width: 40,);
        } else {
          return Image.asset("assets/images/icon_close.png",  height: 40, width: 40,);
        }
        break;
      case 1:
        if (isNotice) {
          return Image.asset("assets/images/icon_open.png",  height: 40, width: 40,);
        } else {
          return Image.asset("assets/images/icon_close.png",  height: 40, width: 40,);
        }
        break;
      case 2:
        if (isRapid) {
          return Image.asset("assets/images/icon_open.png",  height: 40, width: 40,);
        } else {
          return Image.asset("assets/images/icon_close.png",  height: 40, width: 40,);
        }
        break;
    }
  }
}
