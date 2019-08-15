class TestJson {
  static String homeJson = """[
  {
    "id": 0,
    "title": "MRYH",
    "price": 0.01,
    "name": "慕容云海",
    "num": 100,
    "percent": 84.12,
    "icons": [
      "alipay",
      "wechat",
      "yinlian"
    ],
    "count": 100,
    "minLimit": 100.03,
    "maxLimit": 200.03,
    "type": 0
  },
  {
    "id": 1,
    "title": "HZL",
    "price": 0.01,
    "name": "花泽类",
    "num": 100,
    "percent": 84.12,
    "icons": [
      "alipay",
      "wechat",
      "yinlian"
    ],
    "count": 100,
    "minLimit": 100.03,
    "maxLimit": 200.03,
    "type": 1
  },
  {
    "id": 2,
    "title": "XM",
    "price": 0.01,
    "name": "西门",
    "num": 100,
    "percent": 84.12,
    "icons": [
      "alipay"
    ],
    "count": 100,
    "minLimit": 100.03,
    "maxLimit": 200.03,
    "type": 2
  },
  {
    "id": 3,
    "title": "MZ",
    "price": 0.01,
    "name": "美作",
    "num": 100,
    "percent": 84.12,
    "icons": [
      "alipay"
    ],
    "count": 100,
    "minLimit": 100.03,
    "maxLimit": 200.03,
    "type": 3
  }
]""";
  static String homeBanner = """[
  {
    "id": 0,
    "picUrl": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563880974652&di=90ee7c9d7db7086a34a664ce13e82fd7&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F525785c8d049eb21a39860783810704dc3fd821efe16-ut71N0_fw658",
    "title": "",
    "httpUrl": "https://www.baidu.com/"
  },
  {
    "id": 1,
    "picUrl": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563881018446&di=5e48f6f9fedce822e7eb4ca89ea7e2ce&imgtype=0&src=http%3A%2F%2Fpicapi.zhituad.com%2Fphoto%2F67%2F17%2F00FBD.jpg",
    "title": "",
    "httpUrl": "https://www.baidu.com/"
  },
  {
    "id": 2,
    "picUrl": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563881049471&di=782b53df6f3c72c778f990e0211556e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01090c554273960000019ae9858bfa.jpg%401280w_1l_2o_100sh.jpg",
    "title": "",
    "httpUrl": "https://www.baidu.com/"
  }
]""";
  static String homeNotice = """[
  {
    "id": 0,
    "picUrl": "",
    "httpUrl": "https://www.baidu.com/",
    "title": "7月13日停服公告"
  },
  {
    "id": 0,
    "picUrl": "",
    "httpUrl": "https://www.baidu.com/",
    "title": "定投功能重磅上线"
  },
  {
    "id": 0,
    "picUrl": "",
    "httpUrl": "https://www.baidu.com/",
    "title": "2020年更新3.0版本"
  }
]""";
  static String homeShow = """[
  {
    "id": 0,
    "name": "BTC/USDT",
    "point": 1065.27,
    "percent": 0.48,
    "money": 7000.01,
    "isPlus": true
  },
  {
    "id": 1,
    "name": "ETH/USDT",
    "point": 1065.27,
    "percent": 0.04,
    "money": 7000.01,
    "isPlus": false
  },
  {
    "id": 2,
    "name": "EOS/USDT",
    "point": 1065.27,
    "percent": 2.00,
    "money": 7000.01,
    "isPlus": true
  }
]""";
  static String recordInside = """[
  {
    "id": 0,
    "title": "MRYH",
    "price": 0.01,
    "name": "莫容云海",
    "num": 100,
    "percent": 60.01,
    "icons": [
      "alipay",
      "wechat",
      "yinlian"
    ],
    "count": 100,
    "minLimit": 100.01,
    "maxLimit": 200.02,
    "type": 0
  }
]""";
  static String recordOutside = """[
  {
    "id": 0,
    "title": "HZL",
    "price": 0.01,
    "name": "花泽类",
    "num": 100,
    "percent": 60.01,
    "icons": [
      "alipay",
      "wechat",
      "yinlian"
    ],
    "count": 100,
    "minLimit": 100.01,
    "maxLimit": 200.02,
    "type": 1
  }
]""";
  static String recordAgent = """[
  {
    "id": 0,
    "title": "XM",
    "price": 0.01,
    "name": "西门",
    "num": 100,
    "percent": 60.01,
    "icons": [
      "alipay",
      "wechat",
      "yinlian"
    ],
    "count": 100,
    "minLimit": 100.01,
    "maxLimit": 200.02,
    "type": 2
  }
]""";
  static String recordOrder = """[
  {
    "id": 0,
    "title": "MZ",
    "price": 0.01,
    "name": "美作",
    "num": 100,
    "percent": 60.01,
    "icons": [
      "alipay",
      "wechat",
      "yinlian"
    ],
    "count": 100,
    "minLimit": 100.01,
    "maxLimit": 200.02,
    "type": 3
  }
]""";
  static String lotteryType = """[
  {
    "id": null,
    "icon": "default_icon",
    "name": "全部"
  },
  {
    "id": 0,
    "icon": "default_icon",
    "name": "PK10"
  },
  {
    "id": 1,
    "icon": "default_icon",
    "name": "时时彩"
  },
  {
    "id": 2,
    "icon": "default_icon",
    "name": "快3"
  },
  {
    "id": 3,
    "icon": "default_icon",
    "name": "快乐8"
  },
  {
    "id": 4,
    "icon": "default_icon",
    "name": "11选5"
  }
]""";
  static String numberRecord = """[
  {
    "id": 0,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 1,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 2,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 3,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 4,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 5,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 6,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  },
  {
    "id": 7,
    "code": "20190621-031",
    "number": "5,8,4,7,7"
  }
]""";
  static String lotterys = """[
  {
    "id": 0,
    "name": "时时彩",
    "icon": "default_icon",
    "children": [
      {
        "id": 0,
        "name": "重庆时时彩",
        "icon": "default_icon"
      },
      {
        "id": 1,
        "name": "吉利时时彩",
        "icon": "default_icon"
      },
      {
        "id": 2,
        "name": "陕西时时彩",
        "icon": "default_icon"
      },
      {
        "id": 3,
        "name": "新疆时时彩",
        "icon": "default_icon"
      },
      {
        "id": 4,
        "name": "西藏时时彩",
        "icon": "default_icon"
      }
    ]
  },
  {
    "id": 1,
    "name": "PK10",
    "icon": "default_icon",
    "children": [
      {
        "id": 0,
        "name": "东京pk10",
        "icon": "default_icon"
      },
      {
        "id": 1,
        "name": "南京pk10",
        "icon": "default_icon"
      },
      {
        "id": 2,
        "name": "西京pk10",
        "icon": "default_icon"
      },
      {
        "id": 3,
        "name": "北京pk10",
        "icon": "default_icon"
      },
      {
        "id": 4,
        "name": "东京2pk10",
        "icon": "default_icon"
      },
      {
        "id": 5,
        "name": "南京2pk10",
        "icon": "default_icon"
      },
      {
        "id": 6,
        "name": "西京2pk10",
        "icon": "default_icon"
      },
      {
        "id": 7,
        "name": "北京2pk10",
        "icon": "default_icon"
      }
    ]
  },
  {
    "id": 2,
    "name": "快3",
    "icon": "default_icon",
    "children": [
      {
        "id": 0,
        "name": "江苏0快3",
        "icon": "default_icon"
      },
      {
        "id": 1,
        "name": "江苏1快3",
        "icon": "default_icon"
      },
      {
        "id": 2,
        "name": "江苏2快3",
        "icon": "default_icon"
      },
      {
        "id": 3,
        "name": "江苏3快3",
        "icon": "default_icon"
      },
      {
        "id": 4,
        "name": "江苏4快3",
        "icon": "default_icon"
      },
      {
        "id": 5,
        "name": "江苏5快3",
        "icon": "default_icon"
      },
      {
        "id": 6,
        "name": "江苏6快3",
        "icon": "default_icon"
      },
      {
        "id": 7,
        "name": "江苏7快3",
        "icon": "default_icon"
      }
    ]
  }
]""";
}
