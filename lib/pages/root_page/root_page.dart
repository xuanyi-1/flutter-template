import 'package:flutter/material.dart';
import 'package:the_land/pages/cooperate/cooperate_page.dart';
import 'package:the_land/pages/home/home_page.dart';
import 'package:the_land/pages/message/message_page.dart';
import 'package:the_land/pages/my/my_page.dart';

import 'package:bruno/bruno.dart';
import 'package:the_land/pages/work/work_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> pages = [
    const HomePage(),
    const MooperatePage(),
    const WorkPage(),
    const MessagePage(),
    const MyPage()
  ];

  int _selectedIndex = 0;

  /// PageView的控制器
  PageController? _controller;

  @override
  void initState() {
    // 创建PageView的控制器
    _controller = PageController();

    super.initState();
  }

  /// tabbar点击事件
  void _onItemSelected(int index) {
 

    // 控制页面切换
    if (_controller != null) {
      print('123');
      _controller!.jumpToPage(index);
    }

       setState(() {
      _selectedIndex = index;
    });
  }

  var titles = ['首页', '合作', '闪作', '消息', '我的'];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
          
        ),
        bottomNavigationBar: BrnBottomTabBar(
          fixedColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: _onItemSelected,
          items: <BrnBottomTabBarItem>[
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 128, 128, 128),
                )),
                icon: const Icon(
                  Icons.home, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                activeIcon: const Icon(
                  Icons.home, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(titles[0])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 128, 128, 128),
                )),
                icon: const Icon(
                  Icons.people, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                activeIcon: const Icon(
                  Icons.people, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(titles[1])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 128, 128, 128),
                )),
                icon: const Icon(
                  Icons.collections, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                activeIcon: const Icon(
                  Icons.collections, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(titles[2])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 128, 128, 128),
                )),
                icon: const Icon(
                  Icons.chat, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                activeIcon: const Icon(
                  Icons.chat, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(titles[3])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 14.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 128, 128, 128),
                )),
                icon: const Icon(
                  Icons.person, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                activeIcon: const Icon(
                  Icons.person, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(titles[4])),
          ],
        ));
  }
}
