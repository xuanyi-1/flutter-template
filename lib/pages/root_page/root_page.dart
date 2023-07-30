import 'package:flutter/material.dart';
import 'package:the_land/pages/home/home_page.dart';
import 'package:the_land/pages/message/message_page.dart';
import 'package:the_land/pages/my/my_page.dart';
import 'package:the_land/pages/seek/seek_page.dart';
import 'package:bruno/bruno.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> pages = [
    const HomePage(),
    const SeekPage(),
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
    setState(() {
      _selectedIndex = index;
    });

    // 控制页面切换
    if (_controller != null) {
      _controller!.jumpToPage(index);
    }
  }

  var titles = ['One', 'Two', 'Three', 'Four', 'Five', 'Six'];
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
                  fontSize: 12.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 85, 151, 250),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                )),
                icon: const Icon(
                  Icons.home, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                ),
                activeIcon: const Icon(
                  Icons.home, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 85, 151, 250),
                ),
                title: Text(titles[0])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 85, 151, 250),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                )),
                icon: const Icon(
                  Icons.people, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                ),
                activeIcon: const Icon(
                  Icons.people, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 85, 151, 250),
                ),
                title: Text(titles[1])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 85, 151, 250),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                )),
                icon: const Icon(
                  Icons.chat, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                ),
                activeIcon: const Icon(
                  Icons.chat, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 85, 151, 250),
                ),
                title: Text(titles[2])),
            BrnBottomTabBarItem(
                selectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                  color: Color.fromARGB(255, 85, 151, 250),
                )),
                unSelectedTextStyle: (const TextStyle(
                  fontSize: 12.0, // 设置字体大小为 24 像素
                )),
                icon: const Icon(
                  Icons.person, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                ),
                activeIcon: const Icon(
                  Icons.person, // 使用 Material Icons 的 favorite 图标
                  size: 28.0,
                  color: Color.fromARGB(255, 85, 151, 250),
                ),
                title: Text(titles[3])),
          ],
        ));
  }
}
