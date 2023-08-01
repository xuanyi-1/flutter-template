import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:the_land/widgets/video_widgets.dart';

class VideoSwiperPage extends StatefulWidget {
  const VideoSwiperPage({super.key});

  @override
  _VideoSwiperPageState createState() => _VideoSwiperPageState();
}

class _VideoSwiperPageState extends State<VideoSwiperPage> {
  int currentIndex = 0;

  List hotRecommends = [
    {
      "avatarUrl": 'assets/author/avatar/avatar1.jpeg',
      "videoUrl":
          'https://image.youown.net/youown-works/2f0b7b8f6a554fa0be6f71b8a7c3b917.mp4',
      "name": 'John Doe',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar2.png',
      "videoUrl":
          'https://video.youown.com/prd/youown/work/img/4pAxck47boLNWV1688467778954.mp4',
      "name": 'Jane Smith',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar3.png',
      "videoUrl":
          'https://image.youown.net/youown-works/cf2810262dd349db8d58d7d1f9cd62c0.mp4',
      "name": 'Mike Johnson',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar4.jpg',
      "videoUrl":
          'https://video.youown.com/prd/youown/work/img/RSVRK1684227622512.mp4',
      "name": 'Samira',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar5.webp',
      "videoUrl":
          'https://video.youown.com/prd/youown/work/img/3GruSAOpmnxxiG1682487887704.mp4',
      "name": '今天吃鱼',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar6.jpg',
      "videoUrl":
          'https://image.youown.net/youown-works/87b3098d4f404c05bcf059ce13690d38.mp4',
      "name": '茶茶面',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar7.jpg',
      "videoUrl":
          'https://video.youown.com/prd/youown/work/img/nlqDvTFqlbUahOqANW1663317482751.mp4',
      "name": 'En_HAN',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar8.jpg',
      "videoUrl":
          'https://video.youown.com/prd/youown/work/img/hPfVV9G8wFlncSoE1Wi1675238743256.mp4',
      "name": '叫我英俊就好',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar9.jpg',
      "videoUrl":
          'https://video.youown.com/prd/youown/work/img/ubk7j571669887013660.mp4',
      "name": 'yo10171',
    },
    {
      "avatarUrl": 'assets/author/avatar/avatar10.jpg',
      "videoUrl":
          'https://image.youown.net/youown-works/aff07e74d7de43d1a7d6afce2cedaa1e.mp4',
      "name": 'BOBOworks',
    },
  ];

  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    // Your logic here
    print('Selected index: $index');
  }

  @override
  Widget build(BuildContext context) {
    print("build2");
    return Container(
      margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 10.0),
            child: const Text(
              '推荐闪作',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: 300.0,
                      height: 430.0,
                      child: VideoPlayerScreen(
                          videoUrl: hotRecommends[index]['videoUrl'],
                          myIndex: index,
                          currentIndex: currentIndex),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 0,
                      child: SizedBox(
                        width: 300.0,
                        height: 45,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage(
                                  hotRecommends[index]['avatarUrl']), // 头像图片路径
                            ),
                            const SizedBox(width: 10),
                            Text(
                              hotRecommends[index]['name'], // 名称
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 10,
              itemWidth: 300.0,
              itemHeight: 430.0,
              layout: SwiperLayout.STACK,
              onIndexChanged: onIndexChanged),
        ],
      )),
    );
  }
}
