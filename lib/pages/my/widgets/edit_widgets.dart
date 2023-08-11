import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert; // 给库起别名，为了方便调用库里面的方法

class EditWidgets extends StatefulWidget {
  const EditWidgets({super.key});

  @override
  State<EditWidgets> createState() => _EditWidgetsState();
}

class _EditWidgetsState extends State<EditWidgets> {
  late WebViewController controller;

  /// 图片选择器
  final ImagePicker _imagePicker = ImagePicker();

  /// 网页控制器
  late WebViewController _webViewController;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://192.168.0.101:3000/talk-react-app#/edit'))
      ..addJavaScriptChannel(
        'FlutterBack',
        onMessageReceived: (message) {
          Navigator.pop(context);
        },
      )
      ..addJavaScriptChannel(
        'FlutterUserIcon',
        onMessageReceived: (message) {
          // 展示拍照和我的相册对话框
          _showSelectUserIconDialog();
        },
      );

    super.initState();
  }

  /// 拍照和打开相册
  void _cameraAndGallery(ImageSource source) async {
    try {
      XFile? avatarFile = await _imagePicker.pickImage(
          source: source, maxWidth: 1500, maxHeight: 1500);
      // 判断头像是否为空，如果为空终止逻辑
      if (avatarFile == null) return;
      // 网页回显用户头像
      // 将头像文件转字节类型
      List<int> avatarBytes = await avatarFile.readAsBytes();
      // 将字节类型的头像进行base64编码
      String avatarBase64Str = convert.base64Encode(avatarBytes);
      // 给base64字符串添加图片文件前缀：为了方便网页中<img>标签渲染该头像
      avatarBase64Str = 'data:image/jpg;base64,$avatarBase64Str';

      // Flutter调用网页注入用户头像的JS方法（该JS方法需要传入头像base64编码后的字符串）
      // _webViewController.evaluateJavascript('window.XtxBridge.previewAvatar("$avatarBase64Str",true)');
    } catch (e) {
      debugPrint('相机：$e');
    }
  }

  /// 构建选择头像对话框：拍照或打开相册
  void _showSelectUserIconDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: (60.0 * 3) + 21.0,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F8),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 拍照
                        _cameraAndGallery(ImageSource.camera);

                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Container(
                        height: 60.0,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Text(
                          '拍照',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: GestureDetector(
                        onTap: () {
                          // 打开相册
                          _cameraAndGallery(ImageSource.gallery);

                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Container(
                          height: 60.0,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: const Text(
                            '我的相册',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Container(
                    height: 60.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: const Text(
                      '取消',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [Expanded(child: WebViewWidget(controller: controller))],
        ),
      )),
    );
  }
}
