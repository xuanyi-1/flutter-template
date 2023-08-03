import 'package:flutter/material.dart';
import 'package:the_land/pages/my/my_page.dart';
import 'package:the_land/pages/my/widgets/my_home_app_bar.dart';
import 'package:flutter/cupertino.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  double scrollShow = 0;

  final List<String> tabTitles = ['作品', '闪作', '收集', '资料'];

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabTitles.length, vsync: this);
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // 处理滚动事件的逻辑
    double offset = _scrollController.offset;
    print(offset);
    if (offset < 50.0) {
      setState(() {
        scrollShow = 0.0;
      });
      return;
    }

    if (offset >= 50.0) {
      setState(() {
        scrollShow = 0.2;
      });
    }

    if (offset >= 70.0) {
      setState(() {
        scrollShow = 1;
      });
      return;
    }
  }

 void jumpRouter() {

    Navigator.pop(
      context,
      CupertinoPageRoute(builder: (BuildContext context) {
        return const MyPage();
      }),
    );
  }

void shareApp(){
  print(222);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFFF7F7F7), //
      child: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height + 240.0,
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 5.0,
                        left: 10.0,
                        right: 10.0),
                    height: 200.0,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/png2.webp'), // Replace with your actual image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: jumpRouter,
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.white,
                                size: 26,
                              ),
                            )),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child:
                          GestureDetector(
                              onTap: shareApp,
                              child:  const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                            size: 26,
                          ),
                              )
                         
                        ),
                      ],
                    )),
                TabBar(
                  controller: _controller,
                  // 选中和未选中状态颜色
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xFF7F7F7F),
                  labelStyle: const TextStyle(fontSize: 18.0),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4.0, // Change the width of the underline here
                      color: Colors
                          .green, // Change the color of the underline here
                    ),
                    insets: EdgeInsets.symmetric(
                        horizontal:
                            36.0), // Change the length of the underline here
                  ),
                  tabs: [
                    for (var title in tabTitles)
                      Tab(
                        text: title,
                      ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: const [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Tab 1 Content',
                            ),
                            // Add any additional widgets or content for Tab 1 here
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Tab 2 Content',
                            ),
                            // Add any additional widgets or content for Tab 2 here
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Tab 3 Content',
                            ),
                            // Add any additional widgets or content for Tab 3 here
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Text('123'),
                            

                            // Add any additional widgets or content for Tab 3 here
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: MyHomeAppBar(opacityNum: scrollShow),
        ),
      ]),
    ));
  }
}
