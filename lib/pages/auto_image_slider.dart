import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({Key? key}) : super(key: key);

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  final myItems = [
    Image.asset('assets/images/hsdxd.jpg'),
    Image.asset('assets/images/mlb.jpg'),
    Image.asset('assets/images/spider-1.jpg'),
    Image.asset('assets/images/spider-2.jpg'),
    Image.asset('assets/images/tb.jpg'),
    Image.asset('assets/images/teencontre.jpg'),
  ];
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffee3d9),
      appBar: AppBar(
        title: const Text('Tienda de Comics'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: 300,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  }),
              items: myItems,
            ),
            AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: myItems.length,
              effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 10,
                  dotColor: Colors.grey.shade900,
                  paintStyle: PaintingStyle.fill),
            ),
          ],
        ),
      ),
    );
  }
}
