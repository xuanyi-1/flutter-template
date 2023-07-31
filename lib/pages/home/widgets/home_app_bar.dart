import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // 设置 AppBar 的首选高度
}

class _HomeAppBarState extends State<HomeAppBar> {
  int currentIndex = 1;

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
    List<int> numIndex = [0, 1, 2];
    List<String> numName = ['关注', '首页', '闪作'];
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
    return BrnAppBar(
      automaticallyImplyLeading: false,
      //自定义显示的title 为切换的row
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTab(0),
          const SizedBox(
            width: 24,
          ),
          _buildTab(1),
          const SizedBox(
            width: 24,
          ),
          _buildTab(2)
        ],
      ),
      //自定义右侧action
      actions: BrnIconAction(
        child: const Icon(
          Icons.search,
        ),
        iconPressed: () {},
      ),
    );
  }
}
