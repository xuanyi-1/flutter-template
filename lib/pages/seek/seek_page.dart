import 'package:flutter/material.dart';

class SeekPage extends StatefulWidget {
  const SeekPage({super.key});

  @override
  _SeekPageState createState() => _SeekPageState();
}

class _SeekPageState extends State<SeekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const Center(
        child: Text('Hello, 我的!'),
      ),
    );
  }
}
