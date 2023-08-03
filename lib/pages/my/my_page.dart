import 'package:flutter/material.dart';
import 'package:the_land/pages/my/widgets/header_info_widgets.dart';
import 'package:the_land/pages/my/widgets/my_app_bar.dart';
import 'package:the_land/pages/my/widgets/set_widgets.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  
    // 是否记录状态:true表示需要记录组件状态
  @override
  @protected
  bool get wantKeepAlive => true;
  
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

    if (offset < 40.0) {
      setState(() {
        scrollShow = 0.0;
      });
      return;
    }

    if (offset >= 40.0) {
      setState(() {
        scrollShow = 0.2;
      });
    }

    if (offset >= 60.0) {
      setState(() {
        scrollShow = 1;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar:  MyAppBar(opacityNum:scrollShow),
        body:SingleChildScrollView( 
             controller: _scrollController,
          physics:  const BouncingScrollPhysics(), // 使用
          child:Container(
         height:  MediaQuery.of(context).size.height,
            color: const Color(0xFFF7F7F7),
            child:      Column(
                  children: [
                     const HeaderInfoWidgets(),
                    SetWidgets(),
                  ],
                )) ,
        ) );
  }
}
