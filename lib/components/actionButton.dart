import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ActionButton extends StatefulWidget {
  @override
  ActionButtonState createState() => ActionButtonState();
}

class ActionButtonState extends State<ActionButton> {
  Widget build(BuildContext context) {
    return SpeedDial(
      marginRight: 25, //右边距
      marginBottom: 50, //下边距
      animatedIcon: AnimatedIcons.menu_close, //带动画的按钮
      animatedIconTheme: IconThemeData(size: 22.0),
      visible: true, //是否显示按钮
      closeManually: false, //是否在点击子按钮后关闭展开项
      curve: Curves.bounceIn, //展开动画曲线
      overlayColor: Colors.black, //遮罩层颜色
      overlayOpacity: 0.5, //遮罩层透明度
      onOpen: () => print('OPENING DIAL'), //展开回调
      onClose: () => print('DIAL CLOSED'), //关闭回调
      tooltip: 'Speed Dial', //长按提示文字
      heroTag: 'speed-dial-hero-tag', //hero标记
      backgroundColor: Colors.blue, //按钮背景色
      foregroundColor: Colors.white, //按钮前景色/文字色
      elevation: 8.0, //阴影
      shape: CircleBorder(), //shape修饰
      children: [
        //子按钮
        SpeedDialChild(
            child: Icon(Icons.font_download),
            backgroundColor: Colors.red,
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              
            }),
        SpeedDialChild(
          child: Icon(Icons.image),
          backgroundColor: Colors.orange,
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.keyboard_voice),
          backgroundColor: Colors.green,
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            
          },
        ),
      ],
    );
  }
}
