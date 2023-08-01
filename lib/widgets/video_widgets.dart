// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen(
      {super.key,
      required this.videoUrl,
      required this.myIndex,
      required this.currentIndex});

  final String? videoUrl;
  bool isplay = false;
  int currentIndex;
  final int? myIndex;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      widget.videoUrl!,
    );

    if (widget.currentIndex == widget.myIndex) {
      _initializeVideoPlayerFuture = _controller.initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    }
    // Initialize the controller and store the Future for later use.

    // 添加视频播放完成监听
    _controller.addListener(_videoPlayerListener);
    // Use the controller to loop the video.
    // _controller.setLooping(true);
  }

  void _videoPlayerListener() {
    if (_controller.value.position >= _controller.value.duration) {
      // 视频播放完成后，设置视频播放位置为0，实现循环播放
      _controller.seekTo(Duration.zero);
      _controller.play(); // 重新播放视频
    }
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return Container(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
    } else {
      return  Image.network(
              "http://via.placeholder.com/288x188",
              fit: BoxFit.fill,
            );
    }
  }
}
