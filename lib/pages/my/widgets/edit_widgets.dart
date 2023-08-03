import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EditWidgets extends StatefulWidget {
  const EditWidgets({super.key});

  @override
  State<EditWidgets> createState() => _EditWidgetsState();
}

class _EditWidgetsState extends State<EditWidgets> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://192.168.2.200:3000/talk-react-app#/edit'));
    super.initState();
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
