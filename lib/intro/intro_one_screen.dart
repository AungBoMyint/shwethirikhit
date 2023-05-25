import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/affirmations/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

import '../bottombar.dart';
import '../data/image.dart';
import '../utils/utils.dart';
import '../vlog/vlog_controller.dart';

class IntroOneScreen extends StatefulWidget {
  static const RouteName = "intro_one_screen";
  const IntroOneScreen({super.key});

  @override
  State<IntroOneScreen> createState() => _IntroOneScreenState();
}

class _IntroOneScreenState extends State<IntroOneScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late AnimationController _animationController;
  late AnimationController _animationControllerTwo;
  late AnimationController _skipAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _appearAnimation;
  late AnimationController _getStartAnimation;
  late Animation _fadeCurve;
  late Animation _appearCurve;
  bool isFinished = false;
/*   late Animation tweenAnimation;
 */
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset("assets/intro.mp4");
    _videoPlayerController.initialize().then((value) {
      _videoPlayerController.setLooping(true);
    });
    _getStartAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationControllerTwo = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        if (_animationControllerTwo.status == AnimationStatus.completed) {
          //if Animation complete,we need to play video
          _videoPlayerController.play();
          _videoPlayerController.addListener(() {
            final position = _videoPlayerController.value.position;
            final duration = _videoPlayerController.value.duration;

            if (position.inSeconds.round() + 1 == duration.inSeconds.round()) {
              /*  _getStartAnimation.forward(); */
              //Video is Finished.
              _skipAnimation.reverse();
              _getStartAnimation.forward();
              _videoPlayerController.removeListener(() {});
            }
          });
        }
      });
    ;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        if (_animationController.status == AnimationStatus.completed) {
          //if Animation complete,we start animate2
          _animationControllerTwo.forward();
          _skipAnimation.forward();
        }
      });
    _animationController.forward();
    _fadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_animationControllerTwo);
    _appearAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationControllerTwo);
    _fadeCurve = CurvedAnimation(parent: _fadeAnimation, curve: Curves.easeOut);
    _appearCurve =
        CurvedAnimation(parent: _appearAnimation, curve: Curves.easeIn);
    _getStartAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _skipAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    //TODO:Start Timer and Then Go To IntroTwoScreen
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerTwo.dispose();
    _getStartAnimation.dispose();
    _skipAnimation.dispose();
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final VlogController vlogController = Get.find();
    final textPainter = TextPainter(
      text: TextSpan(
        text: "Reach Your True Potential",
        style: TextStyle(fontSize: 16.0), // Provide the desired font style
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final textWidth = textPainter.width;
    final size = MediaQuery.of(context).size;
    final logoPosition = 100;
    final buttonWidth = size.width * 0.7;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              //Video
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: AnimatedBuilder(
                      animation: _appearCurve,
                      builder: (context, child) {
                        return AnimatedOpacity(
                          opacity: _appearCurve.value,
                          duration: const Duration(milliseconds: 1000),
                          child: child,
                        );
                      },
                      child: VideoPlayer(_videoPlayerController),
                    ),
                  )),
              //Intro One
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animationController.value,
                          child: child,
                        );
                      },
                      child: Image.asset(
                        AppImage.logo,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    verticalSpace(5),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        final x = -100 + (_animationController.value * 100);
                        final y = 1.0;
                        return Transform.translate(
                          offset: Offset(x, y),
                          child: AnimatedBuilder(
                            animation: _fadeCurve,
                            builder: (context, child) {
                              return AnimatedOpacity(
                                  duration: _animationControllerTwo.duration!,
                                  opacity: _fadeCurve.value,
                                  child: child);
                            },
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        "SHWE THIRI KHIT",
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    verticalSpace(10),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        final x = 100 - (_animationController.value * 100);
                        final y = 1.0;
                        return Transform.translate(
                          offset: Offset(x, y),
                          child: AnimatedBuilder(
                            animation: _fadeCurve,
                            builder: (context, child) {
                              return AnimatedOpacity(
                                  duration: _animationControllerTwo.duration!,
                                  opacity: _fadeCurve.value,
                                  child: child);
                            },
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        "Self Improvement Application",
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Intro Two
              //Skip
              Positioned(
                top: 10,
                right: 10,
                child: AnimatedBuilder(
                  animation: _skipAnimation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      opacity: _skipAnimation.value,
                      duration: const Duration(milliseconds: 1000),
                      child: child,
                      curve: Curves.easeIn,
                    );
                  },
                  child: TextButton(
                    onPressed: () {
                      _videoPlayerController.removeListener(() {});
                      _getStartAnimation.forward();
                      _skipAnimation.reverse();
                    },
                    child: Text("Skip",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              //GetSTarted
              Positioned(
                top: (size.height / 2) + logoPosition + 20,
                left: (size.width / 2) - buttonWidth / 2,
                child: AnimatedBuilder(
                  animation: _getStartAnimation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      opacity: _getStartAnimation.value,
                      duration: const Duration(milliseconds: 1000),
                      child: child,
                      curve: Curves.easeIn,
                    );
                  },
                  child: SizedBox(
                    height: 50,
                    width: buttonWidth,
                    child: ElevatedButtonTheme(
                      data: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, route(BottomBar()));
                          vlogController.playVideo();
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}