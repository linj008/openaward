
import 'package:flutter/material.dart';

import 'home_data.dart';

class _HomeState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController mController;
  List<TabTitle> tabList;
  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  initTabData() {
    tabList = widget.children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 38.0,
            child: TabBar(
              controller: mController,
              labelColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: false,
              indicatorColor: Colors.red,
              unselectedLabelColor: Colors.black45,
              labelStyle: TextStyle(fontSize: 16.0),
              tabs: tabList.map((item) {
                return Tab(
                  text: item.title,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: mController,
              children: tabList.map((item) {
                return Stack(children: <Widget>[
                  Align(alignment:Alignment.topCenter,child: item.widget,),
                ],);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final List<TabTitle> children;
  const MyHomePage({
    Key key,
    @required this.children,
  }) : assert(children != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}