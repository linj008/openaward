import 'package:flutter/material.dart';

enum ThemeType {
  defaultType,
  nightType,
}

class APPStyle {
  static Color themeColor = Color(0xFFffffff);
  static Color themeTextColor = Color(0xFFffffff);
  static Color background = Colors.black12;
  static Color selectBackground = Colors.white;
  static Color heightLightGreen = Color(0xFF68BA7A);
  static Color heightLightRed = Color(0xFFF17070);
  static Color bottomNavigationBar = Color(0xFF22292c);
  static Color unselectedBottomColor = Color(0xFFF1F1F1);
  static double maxTextSize = 16.0;
  static double midTextSize = 14.0;
  static double minTextSize = 12.0;
  static double mminTextSize = 11.0;
  static Color maxTextColors = Colors.black87;
  static Color midTextColors = Colors.black45;
  static Color minTextColors = Colors.black26;
  static Color betBackg = Color(0xfffaf9f6);
  static Color betLotteryBackg = Color(0xffbbb39c);
  static TextStyle titleTextStyle =
      TextStyle(fontSize: 16, color: Colors.white);
  static TextStyle maxTextStyle =
      TextStyle(fontSize: 16, color: Colors.black87);
  static TextStyle midTextStyle =
      TextStyle(fontSize: 14, color: Colors.black45);
  static TextStyle minTextStyle =
      TextStyle(fontSize: 12, color: Colors.black26);
  static TextStyle whiteMidTextStyle =
      TextStyle(fontSize: 14, color: Colors.white);

  factory APPStyle() => _getInstance();

  static APPStyle get instance => _getInstance();
  static APPStyle _instance;

  APPStyle._internal() {
    setThemeType(ThemeType.defaultType);
  }

  static APPStyle _getInstance() {
    if (_instance == null) {
      _instance = new APPStyle._internal();
    }
    return _instance;
  }

  setThemeType(ThemeType type) {
    switch (type) {
      case ThemeType.defaultType:
        _setDefaultTheme();
        break;
      case ThemeType.nightType:
        _setNightTheme();
        break;
    }
  }

  void _setDefaultTheme() {
    themeColor = Colors.red;
    titleTextStyle = TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700);
    maxTextStyle = TextStyle(fontSize: 16, color: Colors.black45);
    midTextStyle = TextStyle(fontSize: 14, color: Colors.black45);
    minTextStyle = TextStyle(fontSize: 12, color: Colors.black45);
    whiteMidTextStyle = TextStyle(fontSize: 16, color: Colors.white);
    selectBackground = Colors.white;
    background = Colors.black12;
    maxTextSize = 16.0;
    midTextSize = 14.0;
    minTextSize = 12.0;
    maxTextColors = Colors.black87;
    midTextColors = Colors.black45;
    minTextColors = Colors.black26;
  }

  void _setNightTheme() {
    themeColor = Colors.black;
    titleTextStyle = TextStyle(fontSize: 16, color: Colors.white);
    maxTextStyle = TextStyle(fontSize: 16, color: Colors.black45);
    midTextStyle = TextStyle(fontSize: 14, color: Colors.black45);
    minTextStyle = TextStyle(fontSize: 12, color: Colors.black45);
    whiteMidTextStyle = TextStyle(fontSize: 16, color: Colors.white);
    selectBackground = Colors.white;
    background = Colors.black45;
    selectBackground = Colors.white;
    background = Colors.black12;
    maxTextSize = 16.0;
    midTextSize = 14.0;
    minTextSize = 12.0;
    maxTextColors = Colors.black87;
    midTextColors = Colors.black45;
    minTextColors = Colors.black26;
  }
}

class S {
  static Color themeColor = Color(0xFF4780E9);
  static Color bgColor = Color(0xFFFFFFFF);
  static Color secondColor = Color(0xFFF2F2F2);
  static Color textWhite = Color(0xFFFFFFFF);
  static Color textBlack = Color(0xFF000000);
}

class P {
  static String png(String name) => 'assets/images/$name.png';

  static String jpeg(String name) => 'assets/images/$name.jpeg';
}
