import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/therapy/therapy_video.dart';
import '../consultant_appointant/controller/home_controller.dart';
import '../controller/main_controller.dart';
import 'colors.dart' as color;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Therapy extends StatefulWidget {
  const Therapy({Key? key}) : super(key: key);

  @override
  _TherapyState createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  /* List<Info> info = [];
  _initData() async {
    var res = await DefaultAssetBundle.of(context).loadString("json/info.json");
    var resInfo = json.decode(res);
    setState(() {
      info = List<Info>.from(resInfo.map((x) => Info.fromJson(x)));
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }
 */
  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    return SafeArea(
        child: Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: CustomScrollView(slivers: [
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 30,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: new AssetImage('assets/user.png'),
                    radius: 15,
                    // child: new Container(
                    //   padding: const EdgeInsets.all(0.0),
                    //   child: new Text('Sight'),
                    // ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Shwe Thiri Khit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      wordSpacing: 1,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  SizedBox(
                    width: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.resolveWith<double>(
                          // As you said you dont need elevation. I'm returning 0 in both case
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return 0;
                            }
                            return 0; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await launch('https://m.me/selfmasterywithkhit');
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.facebookMessenger,
                        color: Colors.blue,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ))),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(child: Container()),
                // InkWell(
                //     onTap: () {
                //       Get.to(() => VideoInfo());
                //     },
                //     child: Row(
                //       children: [
                //         Text(
                //           "Details",
                //           style: TextStyle(
                //             fontSize: 20,
                //             color: color.AppColor.homePageDetail,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 5,
                //         ),
                //         Icon(Icons.arrow_forward,
                //             size: 20, color: color.AppColor.homePageIcons)
                //       ],
                //     ))
              ],
            ),
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 30,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: color.AppColor.gradientSecond.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image.asset('assets/intro-illustration1.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "Increased Self-Esteem and Achieve Your True Potential.Be YOU that you've always wanted to be...",
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Shwe Thiri Khit",
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                          child: InkWell(
                            onTap: () {
                              /* ///
                              TODO
                              Get.to(() => VideoInfo()); */
                            },
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))),
        // SliverPadding(
        //     padding: EdgeInsets.symmetric(
        //       vertical: 0.w,
        //       horizontal: 30.w,
        //     ),
        //     sliver: SliverToBoxAdapter(
        //         child: Container(
        //       height: 180,
        //       width: MediaQuery.of(context).size.width,
        //       child: Stack(
        //         children: [
        //           Container(
        //             width: MediaQuery.of(context).size.width,
        //             margin: const EdgeInsets.only(top: 30),
        //             height: 120,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(20),
        //                 image: DecorationImage(
        //                     image: AssetImage("assets/card.jpg"),
        //                     fit: BoxFit.fill),
        //                 boxShadow: [
        //                   BoxShadow(
        //                       blurRadius: 40,
        //                       offset: Offset(8, 10),
        //                       color: color.AppColor.gradientSecond
        //                           .withOpacity(0.3)),
        //                   BoxShadow(
        //                       blurRadius: 10,
        //                       offset: Offset(-1, -5),
        //                       color: color.AppColor.gradientSecond
        //                           .withOpacity(0.3))
        //                 ]),
        //           ),
        //           Container(
        //             height: 200,
        //             width: MediaQuery.of(context).size.width,
        //             margin: const EdgeInsets.only(right: 200, bottom: 30),
        //             decoration: BoxDecoration(
        //               // color:Colors.redAccent.withOpacity(0.2),
        //               borderRadius: BorderRadius.circular(20),
        //               image: DecorationImage(
        //                 image: AssetImage("assets/figure.png"),
        //                 //fit:BoxFit.fill
        //               ),
        //             ),
        //           ),
        //           Container(
        //             width: double.maxFinite,
        //             height: 100,
        //             margin: const EdgeInsets.only(left: 150, top: 50),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   "You are doing great",
        //                   style: TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                       color: color.AppColor.homePageDetail),
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 RichText(
        //                     text: TextSpan(
        //                         text: "Keep it up\n",
        //                         style: TextStyle(
        //                           color: color.AppColor.homePagePlanColor,
        //                           fontSize: 16,
        //                         ),
        //                         children: [
        //                       TextSpan(text: "stick to your plan")
        //                     ]))
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     ))),

        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              child: Text(
                "Healing & Theraputic Activities",
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.homePageTitle),
              ),
            ))),

        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 30,
            ),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final category = _homeController.therapyCategories[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VideoInfo(
                              videoList: _homeController
                                  .getTherapyVideoByCategory(category.id)))),
                      child: Container(
                        height: 200,
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(category.image),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1)),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1))
                            ]),
                        child: Center(
                          child: Align(
                            child: Text(category.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail)),
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: _homeController.therapyCategories.length,
                ))),
      ]),
    ));
  }
}

class Info {
  String? title;
  String? img;

  Info({
    this.title,
    this.img,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        img: json["img"],
      );
}
