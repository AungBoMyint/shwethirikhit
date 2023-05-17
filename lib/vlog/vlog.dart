import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../consultant_appointant/controller/home_controller.dart';

class Vlog extends StatefulWidget {
  @override
  _VlogState createState() => _VlogState();
}

class _VlogState extends State<Vlog> {
  final HomeController _homeController = Get.find();
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(
            _homeController.vlogVideos.first.videoURL),
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }

  nestedAppBar(width, height) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Chewie(
                controller: _chewieController,
              ),
            ),
          ),
        ];
      },
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            // color: Colors.black,
            color: Color.fromRGBO(85, 38, 38, 1),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _homeController.vlogVideos.first.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     'နောက် ၅ နှစ်မှာ ဖြစ်လာချင်တဲ့ ကိုယ့်ရဲ့ပုံစံ၊ ရည်မှန်းပုံဖော်ထားတဲ့ အနာဂတ်မိမိကို ချိတ်ဆက်မိလေလေ... လက်ရှိပစုပ္ပန်မှာ ချမှတ်လိုက်တဲ့ ဆုံးဖြတ်ချက်တွေ၊ ',
                //     style: TextStyle(color: Colors.white, fontSize: 14.0),
                //   ),
                // ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _homeController.vlogVideos.length,
            itemBuilder: (context, index) {
              final vlogVideo = _homeController.vlogVideos[index];
              return getLessonTile(
                  vlogVideo.title, vlogVideo.image, 'locked', width);
            },
          ),
        ],
      ),
    );
  }

  getLessonTile(String title, String img, String status, double width) {
    return Container(
      color: Color.fromRGBO(85, 38, 38, 1), // Will work
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 120.0,
            height: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromRGBO(85, 38, 38, 1),
              width: width - 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 4.0, right: 8.0, left: 8.0),
                    child: Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'Signika Negative',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    child: Text(
                      '5 Mins',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12.0,
                        height: 1.6,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       Icon(
                  //         (status == 'locked') ? Icons.lock : Icons.lock_open,
                  //         size: 20.0,
                  //       ),
                  //       SizedBox(width: 3.0),
                  //       Text((status == 'locked') ? 'Locked' : 'Unlocked'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: nestedAppBar(width, height),
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
