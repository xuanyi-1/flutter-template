import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class MyHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
   const MyHomeAppBar({super.key, required this.opacityNum});


 final double opacityNum;

  @override
  _MyHomeAppBarState createState() => _MyHomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56); // 设置 AppBar 的首选高度
}

class _MyHomeAppBarState extends State<MyHomeAppBar> {
  



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
    List<String> numName = ['yo1582982999'];
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
      child:
      
       Visibility(
        visible: widget.opacityNum!=0.0?true:false,
        child:  Opacity(
            opacity: widget.opacityNum,
            child: BrnAppBar(
        automaticallyImplyLeading: false,
        //自定义显示的title 为切换的row
        title: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_buildTab(0)],
            ),
        //自定义右侧action
        actions: BrnIconAction(
          child: const Icon(
            Icons.edit,
          ),
          iconPressed: () {},
        ),
      )) ,
       )
     ,
    );
  }
}
