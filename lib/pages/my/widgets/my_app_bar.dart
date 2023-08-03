import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

// ignore: must_be_immutable
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.opacityNum});

  double opacityNum;

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // 设置 AppBar 的首选高度
}

class _MyAppBarState extends State<MyAppBar> {
  int currentIndex = 0;

  final TextStyle selectedHeiStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final TextStyle unSelectedHeiStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 16,
  );

  Widget _buildTab(int index) {
    List<int> numIndex = [0];
    List<String> numName = ['个人中心'];
    String text = '';
    if (numIndex.contains(index)) {
      text = numName[numIndex.indexOf(index)];
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Text(
        text,
        style: currentIndex == index ? selectedHeiStyle : unSelectedHeiStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BrnAppBar(
        automaticallyImplyLeading: false,
        //自定义显示的title 为切换的row
        title: Opacity(
            opacity: widget.opacityNum,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_buildTab(0)],
            )),
        //自定义右侧action
        actions: BrnIconAction(
          child: const Icon(
            Icons.edit,
          ),
          iconPressed: () {},
        ),
      ),
    );
  }
}
