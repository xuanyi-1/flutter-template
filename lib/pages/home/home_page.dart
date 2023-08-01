import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:the_land/pages/home/widgets/home_app_bar.dart';
import 'package:the_land/pages/home/widgets/recommend_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // 是否记录状态:true表示需要记录组件状态
  @override
  @protected
  bool get wantKeepAlive => true;

  final List<String> imageList = [
    'assets/swiper/swiper1.webp',
    'assets/swiper/swiper2.webp',
    'assets/swiper/swiper3.webp',
  ];

  List hotRecommends = [
    {
      "imgUrl": 'assets/work/work1.webp',
      "name": 'Sherlocksss',
      "avatarUrl": 'assets/author/avatar/avatar1.jpeg',
      "label": '深海《DEEP》高级影像第七期'
    },
    {
      "imgUrl": 'assets/work/work2.webp',
      "name": '波宁Bolin',
      "avatarUrl": 'assets/author/avatar/avatar2.png',
      "label": 'CASEKOO CloudCush'
    },
    {
      "imgUrl": 'assets/work/work3.webp',
      "name": '北故',
      "avatarUrl": 'assets/author/avatar/avatar3.png',
      "label": '3D角色'
    },
    {
      "imgUrl": 'assets/work/work4.webp',
      "name": '不正经制造',
      "avatarUrl": 'assets/author/avatar/avatar4.jpg',
      "label": '字体设计(野去找感觉)'
    },
    
    {
      "imgUrl": 'assets/work/work5.webp',
      "name": 'DTWO DESIGN',
      "avatarUrl": 'assets/author/avatar/avatar5.webp',
      "label": 'Wisdom-Reverse'
    },
    {
      "imgUrl": 'assets/work/work6.webp',
      "name": '山丘',
      "avatarUrl": 'assets/author/avatar/avatar6.jpg',
      "label": '蒙牛酸酸乳｜三维动画'
    },
    {
      "imgUrl": 'assets/work/work7.webp',
      "name": 'awing',
      "avatarUrl": 'assets/author/avatar/avatar7.jpg',
      "label": 'Time stationery 时间文具'
    },
     {
      "imgUrl": 'assets/work/work8.webp',
      "name": '月月鸟呀',
      "avatarUrl": 'assets/author/avatar/avatar8.jpg',
      "label": 'Santorini dreams'
    },
  ];

  List<Map<String, dynamic>> people = [
    {
      "avatarUrl": 'assets/author/avatar/avatar1.jpeg',
      "backgroundUrl": 'assets/author/background/bg1.webp',
      "name": 'John Doe',
      "label": '硬表面建模 | 灯光渲染 | 角色IP'
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar2.png',
      "backgroundUrl": 'assets/author/background/bg2.webp',
      "name": 'Jane Smith',
      "label": '动画设计 | 视觉效果 | 3D建模',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar3.png',
      "backgroundUrl": 'assets/author/background/bg3.webp',
      "name": 'Mike Johnson',
      "label": 'AE特效 | 材质绘制 | 灯光渲染',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar4.jpg',
      "backgroundUrl": 'assets/author/background/bg4.webp',
      "name": 'Samira',
      "label": '硬表面建模 | 灯光渲染 | 角色IP'
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar5.webp',
      "backgroundUrl": 'assets/author/background/bg5.webp',
      "name": '今天吃鱼',
      "label": '角色IP | 产品设计 | 动态设计 | 包装设计',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar6.jpg',
      "backgroundUrl": 'assets/author/background/bg6.webp',
      "name": '茶茶面',
      "label": '动画师（三维） | 创意总监',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar7.jpg',
      "backgroundUrl": 'assets/author/background/bg7.webp',
      "name": 'En_HAN',
      "label": '硬表面建模 | 灯光渲染 | 角色IP'
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar8.jpg',
      "backgroundUrl": 'assets/author/background/bg8.webp',
      "name": '叫我英俊就好',
      "label": '产品设计 | 包装设计',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar9.jpg',
      "backgroundUrl": 'assets/author/background/bg9.webp',
      "name": 'yo10171',
      "label": '动态设计',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar10.jpg',
      "backgroundUrl": 'assets/author/background/bg10.webp',
      "name": 'BOBOworks',
      "label": '导演（CG） | 美术指导（CG） | 灯光渲染 | 动态设计 | 后期合成',
    },
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
  }

  List<Widget> _buildAuthor() {
    List<Widget> items = [];
    for (var item in people) {
      items.add(Container(
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.only(top: 135.0, left: 10.0),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(item['backgroundUrl']),
            fit: BoxFit.cover, // 设置图片的适应方式
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage(item['avatarUrl']), // 设置头像图片路径
              ),
              const SizedBox(width: 10),
              Text(
                item['name'], // 名字
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              item['label'], // 长文本
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          )),
        ]),
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    print("build1");
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
                    height: MediaQuery.of(context).size.height -
                        400, // 设置容器的高度，用于显示图片轮播
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          imageList[index], // 加载图片轮播项
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: imageList.length,
                      autoplay: true,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                    height: 250.0,
                    child: Column(
                      // 横轴(副轴)方向左对齐
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // 子元素在水平方向上居中对齐
                      children: <Widget>[
                        const Text(
                          '认证设计师',
                          style: TextStyle(
                            fontSize: 16, // 设置字体大小为 24
                            fontWeight: FontWeight.bold, // 设置字体加粗
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(
                              top: 10.0), // 添加所有方向的外边距为 20
                          child: ListView(
                            scrollDirection: Axis.horizontal, // 设置滚动方向为水平
                            children: _buildAuthor()

                            // 添加更多子元素
                            ,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                 SliverToBoxAdapter(
                  child: RecommendWidgets(hotRecommends:hotRecommends),
                )
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