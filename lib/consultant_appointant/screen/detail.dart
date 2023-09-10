import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/image.dart';
import 'package:kzn/utils/utils.dart';
import '../model/expert.dart';
import '../widget/custom_tag.dart';
import 'booking.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "detail_page";
  const DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final expertModel = Get.arguments as ExpertModel;
    final rating = int.tryParse(expertModel.rating) ?? 0;
    final isTablet = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      backgroundColor: mainThemeColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          items: [
                            CarouselChild(photolink: expertModel.photolink),
                            CarouselChild(photolink: expertModel.photolink2),
                            CarouselChild(photolink: expertModel.photolink3),
                          ],
                          options: CarouselOptions(
                            height: 350,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTag(
                            insidePadding: 10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            backgroundColor: Colors.black,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage(
                                  AppImage.sa,
                                ),
                              ),
                              horizontalSpace(10),
                              Text(
                                "Shwe Thiri Khit",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          CustomTag(
                            insidePadding: 10,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            backgroundColor: mainThemeColor,
                            children: [
                              RatingBar.builder(
                                itemSize: 20,
                                ignoreGestures: true,
                                initialRating: rating / 2,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Text(
                                expertModel.rating,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.all(20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Text(
                          expertModel.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          expertModel.description,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: SafeArea(
                child: IconButton(
                  onPressed: Get.back,
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselChild extends StatelessWidget {
  const CarouselChild({
    super.key,
    required this.photolink,
  });

  final String photolink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: CachedNetworkImage(
          imageUrl: photolink, width: double.infinity, fit: BoxFit.cover),
    );
  }
}
