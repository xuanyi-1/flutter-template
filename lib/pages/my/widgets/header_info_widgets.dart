import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_land/pages/my/my_home_page_widgets.dart';

class HeaderInfoWidgets extends StatefulWidget {
  const HeaderInfoWidgets({super.key});

  @override
  _HeaderInfoWidgetsState createState() => _HeaderInfoWidgetsState();
}

class _HeaderInfoWidgetsState extends State<HeaderInfoWidgets> {
  void jumpRouter() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (BuildContext context) {
        return const MyHomePage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20.0,
                  child: Stack(alignment: Alignment.topLeft, children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius:
                              30, // Adjust the radius to control the size of the avatar
                          backgroundImage: NetworkImage(
                              'https://image.youown.net/youown-works/9HLIB9SP8VV91612544043838.jpg'), // Use your image asset here
                        ),
                        // 我的主页
                        Container(
                          width: 80,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: InkWell(
                            onTap: () {
                              // 处理点击事件
                              jumpRouter();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '我的主页',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Positioned(
                      left: 68.0,
                      bottom: -15,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        height: 90.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: const Text('yo1582982999',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8C8C8C)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(
                                        10), // Set the border radius here
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.branding_watermark,
                                        size: 14,
                                        color: Color(0xFF8C8C8C),
                                      ),
                                      SizedBox(width: 2),
                                      Text('已实名',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xFF8C8C8C))),
                                      Icon(
                                        Icons.navigate_next,
                                        color: Color(0xFF8C8C8C),
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5.0),
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8C8C8C)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(
                                        10), // Set the border radius here
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.admin_panel_settings,
                                        size: 14,
                                        color: Color(0xFF8C8C8C),
                                      ),
                                      SizedBox(width: 2),
                                      Text('未认证',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xFF8C8C8C))),
                                      Icon(
                                        Icons.navigate_next,
                                        color: Color(0xFF8C8C8C),
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 第一个column，显示"number"
                Column(
                  children: [
                    Text('0'),
                    Text('粉丝'),
                  ],
                ),
                // 第二个column，显示"粉丝"
                Column(
                  children: [
                    Text('0'),
                    Text('关注'),
                  ],
                ),
                // 第三个column，未提供信息
                Column(
                  children: [
                    Text('0'),
                    Text('获赞'),
                  ],
                ),
                // 第四个column，未提供信息
                Column(
                  children: [
                    Text('0'),
                    Text('收集'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
