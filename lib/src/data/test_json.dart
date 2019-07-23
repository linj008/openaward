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
}
