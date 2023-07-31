import 'package:flutter/material.dart';

class MooperatePage extends StatefulWidget {
  const MooperatePage({super.key});

  @override
  _MooperatePageState createState() => _MooperatePageState();
}

class _MooperatePageState extends State<MooperatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const Center(
        child: Text('Hello, 合作!'),
      ),
    );
  }
}
