import 'package:flutter/material.dart';
import 'package:opening_award/src/data/model/banner.dart';

//公告栏动画 垂直淡入淡出
class NoticeVecAnimation extends StatefulWidget {
  final Duration duration;
  final List<BannerData> notices;

  const NoticeVecAnimation({
    Key key,
    this.duration = const Duration(milliseconds: 3000),
    this.notices,
  }) : super(key: key);

  @override
  _NoticeVecAnimationState createState() {
    return _NoticeVecAnimationState();
  }
}

class _NoticeVecAnimationState extends State<NoticeVecAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  int _nextMassage = 0;

  //透明度
  Animation<double> _opacityAni1, _opacityAni2;

  //位移
  Animation<Offset> _positionAni1, _positionAni2;

  @override
  Widget build(BuildContext context) {
    //正向开启动画
    return SlideTransition(
      position: _positionAni2,
      child: FadeTransition(
        opacity: _opacityAni2,
        child: SlideTransition(
          position: _positionAni1,
          child: FadeTransition(
            opacity: _opacityAni1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.notices == null
                        ? ''
                        : widget.notices[_nextMassage].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //纵向滚动
  void _startVerticalAni() {
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _opacityAni1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.1, curve: Curves.linear)),
    );

    _opacityAni2 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.9, 1.0, curve: Curves.linear)),
    );

    _positionAni1 = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.1, curve: Curves.linear)),
    );

    _positionAni2 = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -0.5),
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.9, 1.0, curve: Curves.linear)),
    );

    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _nextMassage++;
            if (_nextMassage >=
                (widget.notices == null ? 0 : widget.notices.length)) {
              _nextMassage = 0;
            }
          });
          _controller.reset();
          _controller.forward();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  //释放
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startVerticalAni();
  }
}
