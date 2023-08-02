import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListWidgets extends StatelessWidget {
  ListWidgets({super.key,required this.textInfo});


  List textInfo = [
   
  ];

  List<Widget> buildItem(textInfo) {
    List<Widget> item = [];
  
    for (var i = 0; i < textInfo.length; i++) {
      item.add(Container(
        height: 50.0,
        decoration: BoxDecoration(
          border:i==textInfo.length-1?null: Border(
              bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2), width: 1.0)), // 设置下边框样式
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child:  Row(
                children: [
                   Icon(
                   textInfo[i]['icon'],
                  ),
                  Text(textInfo[i]['title'])
                ],
              ),
            ),
            const Icon(
              Icons.navigate_next,
              color: Color(0xFF8C8C8C),
              size: 24,
            ),
          ],
        ),
      ));
    }
    return item;
  }

  Widget buildOne(textInfo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.only(left: 10.0),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white, // 设置背景颜色为白色
        borderRadius: BorderRadius.circular(5.0), // 设置圆角半径为8.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child:  Row(
              children: [
                 Icon(
                textInfo[0]['icon'],
                ),
                Text(textInfo[0]['title'])
              ],
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: Color(0xFF8C8C8C),
            size: 24,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (textInfo.length == 1) {
      return Container(
        child: buildOne(textInfo),
      );
    } else {
      return Container(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          padding: const EdgeInsets.only(left: 10.0),
          height:50.0*textInfo.length,
          decoration: BoxDecoration(
            color: Colors.white, // 设置背景颜色为白色
            borderRadius: BorderRadius.circular(5.0), // 设置圆角半径为8.0
          ),
          child: Column(
            children:buildItem(textInfo),
          ),
        ),
      );
    }
  }
}
