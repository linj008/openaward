import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  final Widget children;
  const TabPage({
    Key key,
    @required this.children,
  }) : assert(children != null),
        super(key: key);
  @override
  _TabPageState createState() => new _TabPageState();
}

class _TabPageState extends State<TabPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;//是否保存状态
  Widget _children;
  @override
  Widget build(BuildContext context) {
    _children = widget.children;
    return Scaffold(
      body: Center(
        child: _children,
      ),
    );
  }
}