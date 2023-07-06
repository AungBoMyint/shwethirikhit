import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data/constant.dart';
import 'intro_slider_item.dart';

class IntroSlider extends StatelessWidget {
  List<String> photos;
  IntroSlider({required this.photos});
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 55 * 8;

    return /* (photos.length == 0)
        ? Container(
            color: Colors.grey,
          )
        : Container(
            color: logoColor,
            // height: 28.125 * 7,
            height: isTablet ? 55 * 8 : 28.125 * 8,
            //color: Colors.blueAccent,
            child: */
        CarouselSlider(
            options: CarouselOptions(
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlay: true,
              initialPage: 1,
              /* height: isTablet ? 55 * 8 : 28.125 * 8,
                  // height: 55 * 8,
                  // height: 28.125 * 8, */
              enableInfiniteScroll: true,
            ),
            items: List.generate(
                10,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.asset(
                        "assets/slideshow/${index + 1}.jpg",
                        fit: BoxFit.fill,
                      ),
                    ))); /* ),
          ); */
  }
}
