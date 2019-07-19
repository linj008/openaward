import 'package:flutter/material.dart';

enum ViewRequestType {
  eViewRequestTypeView,
  eViewRequestTypeServer,
  eViewRequestTypeBack,
}

class ViewBasicRequest{
  String key;
  ViewRequestType type;
  BuildContext context;
  dynamic data;
}

class ViewBasicResponse{
  String key;
  String code;
  String message;
  dynamic data;
}

class ViewBasicData{

}

class ViewToViewData{
  bool isReturnParams = false;
  bool isReplace = false;
  dynamic data;
}
