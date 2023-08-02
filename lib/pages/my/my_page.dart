import 'package:flutter/material.dart';
import 'package:the_land/pages/my/widgets/header_info_widgets.dart';
import 'package:the_land/pages/my/widgets/my_app_bar.dart';
import 'package:the_land/pages/my/widgets/set_widgets.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body:SingleChildScrollView( 
          physics:  const BouncingScrollPhysics(), // 使用
          child:Container(
         height:  MediaQuery.of(context).size.height,
            color: const Color(0xFFF7F7F7),
            child:      Column(
                  children: [
                     HeaderInfoWidgets(),
                    SetWidgets(),
                  ],
                )) ,
        ) );
  }
}
