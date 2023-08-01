import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class MooperatePage extends StatefulWidget {
  const MooperatePage({super.key});

  @override
  _MooperatePageState createState() => _MooperatePageState();
}

class _MooperatePageState extends State<MooperatePage> {
  @override
  Widget build(BuildContext context) {
    print("build2");
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text('推荐闪作',style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
            ),
            Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "http://via.placeholder.com/288x188",
              fit: BoxFit.fill,
            );
          },
          itemCount: 10,
          itemWidth: 320.0,
          itemHeight: 430.0,
          layout: SwiperLayout.STACK,
        ),
          ],
        )
      ),
    );
  }
}
