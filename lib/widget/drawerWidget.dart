import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
  var isDrag;
  var width;
  var onWillAccept;
  var onAccept;
  var onLeave;
  DrawerWidget({Key key, this.onWillAccept, this.onAccept, this.onLeave, this.width, this.isDrag}) : super(key: key);
}

class _DrawerWidgetState extends State<DrawerWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _animation = Tween(begin: Offset(0.0, 1.0), end: Offset.zero).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.reset();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: DragTarget<int>(
        builder: (BuildContext context, List<int> candidateData, List<dynamic> rejectedData) {
          return Container(
            width: widget.width,
            height: 50,
            color: widget.isDrag ? Colors.red : Colors.redAccent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      !widget.isDrag ? Icons.delete : Icons.delete_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.isDrag ? "松开取消删除" : "拖到此处删除",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          );
        },
        onWillAccept: (data) {
          widget.onWillAccept(data);
          return data != null; //当Draggable传递过来的dada不是null的时候 决定接收该数据。
        },
        onAccept: (data) => {widget.onAccept(data)},
        onLeave: (data) => {widget.onLeave(data)},
      ),
    );
  }
}
