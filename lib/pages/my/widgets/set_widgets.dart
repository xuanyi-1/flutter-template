import 'package:flutter/material.dart';
import 'package:the_land/pages/my/widgets/list_widgets.dart';

class SetWidgets extends StatelessWidget {
  SetWidgets({super.key});

  List textInfo1 = [
    {"icon": Icons.sticky_note_2, "title": '发起新合约'},
    {"icon": Icons.handshake, "title": '需求合作'},
  ];

  List textInfo2 = [
    {"icon": Icons.badge, "title": '设计师认证'},
  ];

  List textInfo3 = [
    {"icon": Icons.insert_drive_file, "title": '课程'},
    {"icon": Icons.download, "title": '缓存管理'},
    {"icon": Icons.grading, "title": '订单'},
  ];

  List textInfo4 = [
    {"icon":Icons.receipt_long, "title": '发票'},
  ];

  List textInfo5 = [
    {"icon": Icons.settings, "title": '设置'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Container(
        child: Column(
          children: [
            ListWidgets(textInfo: textInfo1),
            ListWidgets(textInfo: textInfo2),
            ListWidgets(textInfo: textInfo3),
            ListWidgets(textInfo: textInfo4),
            ListWidgets(textInfo: textInfo5),
          ],
        ),
      ),
    );
  }
}


