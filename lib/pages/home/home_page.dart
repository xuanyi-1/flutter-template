import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:the_land/pages/home/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    'https://via.placeholder.com/350x150',
    'https://via.placeholder.com/350x150',
    'https://via.placeholder.com/350x150',
    'https://via.placeholder.com/350x150',
  ];

  final ScrollController _scrollController = ScrollController();

  double scrollShow = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll); // 添加滚动监听器
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 在页面销毁时释放资源
    super.dispose();
  }

  void _handleScroll() {
    // 处理滚动事件的逻辑
    double offset = _scrollController.offset;

    if (offset < 60.0) {
      setState(() {
        scrollShow = 0.0;
      });
      return;
    }

    if (offset >= 60.0) {
      setState(() {
        scrollShow = 0.2;
      });
    }

    if (offset >= 80.0) {
      setState(() {
        scrollShow = 1;
      });
      return;
    }

    debugPrint('$offset');
    // 在这里根据 offset 的值进行逻辑处理，比如判断滚动到了特定位置并执行相应的操作
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 添加一个容器作为 CustomScrollView 的子部件
        color: const Color.fromRGBO(247, 247, 248, 1.0),
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 420, // 设置容器的高度，用于显示图片轮播
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          imageList[index], // 加载图片轮播项
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: imageList.length,
                      pagination: const SwiperPagination(), // 添加轮播图的指示器
                      control: const SwiperControl(), // 添加轮播图的控制按钮（向左、向右切换）
                    ),
                  ),
                ),
              ],
            ), // 将你的 body 内容放在 Stack 中
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: scrollShow,
                  child: const HomeAppBar(),
                )),
          ],
        ),
      ),
    );
  }
}
//  HomeAppBar()