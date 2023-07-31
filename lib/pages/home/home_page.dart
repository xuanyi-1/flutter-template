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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(
        // 添加一个容器作为 CustomScrollView 的子部件
        color: const Color.fromRGBO(247, 247, 248, 1.0),
        child: CustomScrollView(
          slivers: <Widget>[
        
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200, // 设置容器的高度，用于显示图片轮播
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
        ),
      ),
    );
  }
}
