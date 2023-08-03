import 'package:flutter/material.dart';

class MyHomeInfo extends StatelessWidget {
  const MyHomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(
        height: 50.0,
        child:     Row(
            children: [
              Stack(
                children: [
               
                  Container(
                    margin: const EdgeInsets.only(left: 100.0,top: 10.0),
                    width: MediaQuery.of(context).size.width - 130,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("0"), // 第一个 Column 中的文本
                            Text("人气"), // 第二个 Column 中的文本
                          ],
                        ),
                        Column(
                          children: [
                            Text("0"), // 第一个 Column 中的文本
                            Text("粉丝"), // 第二个 Column 中的文本
                          ],
                        ),
                        Column(
                          children: [
                            Text("0"), // 第一个 Column 中的文本
                            Text("关注"), // 第二个 Column 中的文本
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10.0,
                      child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 40.0),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://image.youown.net/youown-works/9HLIB9SP8VV91612544043838.jpg'), // Use your image asset here
                    ),
                  ))
                ],
              )
            ],
          ),
      ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: const Text(
              "yo1582982999",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: const Row(
              children: [
                Icon(Icons.male_outlined, size: 20, color: Colors.blue),
                Text(
                  '设计爱好者',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: const Text(
              '这个人很懒，什么都没写',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
