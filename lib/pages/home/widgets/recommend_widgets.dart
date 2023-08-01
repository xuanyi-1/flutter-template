import 'package:flutter/material.dart';
import 'package:the_land/pages/home/widgets/video_swiper.dart';

class RecommendWidgets extends StatelessWidget {
  const RecommendWidgets({super.key, this.hotRecommends});

  /// 热门推荐数据
  final List? hotRecommends;

  List<Widget> _buildItem(hotRecommends) {
    List<Widget> items = [];

    for (var data in hotRecommends) {
      items.add(Container(
          child: Column(children: [
        Image.asset(
          data[
              'imgUrl'], // Assuming imageUrl is the key for the image URL in hotRecommends data

          height: 300,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(
              top: 10.0,
              left: 5.0,
              right: 5.0,
              bottom: 10.0), // Add padding to the Container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side content
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(data['name']), Text(data['label'],style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),)],
                ),
              ),

              // Right side content
              CircleAvatar(
                radius:
                    20, // Adjust the radius to control the size of the avatar
                backgroundImage:
                    AssetImage(data['avatarUrl']), // Use your image asset here
              ),
            ],
          ),
        )
      ])));
    }
  items.insert(2, const VideoSwiperPage());
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0), //
      child: Column(
        children: _buildItem(hotRecommends),
      ),
    );
  }
}
