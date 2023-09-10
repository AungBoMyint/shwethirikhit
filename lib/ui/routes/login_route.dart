import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
// import 'package:kzn/bottom_nav/bankslip.dart';
import 'package:kzn/data/models/user.dart';
import 'package:kzn/providers/user_provider.dart';
import 'package:kzn/ui/routes/enroll_form_route.dart';
import 'package:kzn/utils/utils.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/image.dart';
import 'main_route.dart';

class LoginRoute extends StatefulWidget {
  static final routeName = "/login_route";

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute>
    with SingleTickerProviderStateMixin {
  String? username;
  String? password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: secondMainThemeColor),
          backgroundColor: mainThemeColor,
          actions: [
            SizedBox(
              width: 25,
              child: InkWell(
                onTap: () async {
                  try {
                    await launch('https://m.me/selfmasterywithkhit');
                  } catch (e) {
                    print(e);
                  }
                },
                child: Image.asset(
                  AppImage.messenger,
                  /* width: 23,
                                          height: 23, */
                ),
              ),
            ),
            horizontalSpace(20),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // heading
            Container(
              child: Stack(
                children: [
                  // custom painter
                  Container(
                    //color: Colors.green,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage('assets/logotext.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // login form
            Column(
              children: [
                // username input
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        //border: Border.all(color: mainThemeColor)
                        ),
                    child: TextField(
                      onChanged: (String str) {
                        setState(() {
                          username = str;
                        });
                      },
                      //style: TextStyle(color: mainThemeColor),
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: mainThemeColor)
                            ),
                        focusedBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: mainThemeColor)
                            ),
                        disabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.red)
                            ),
                        hintText: 'Enter username',
                        labelText: 'Username',
                        //hintStyle: TextStyle(color: mainThemeColor),
                        //labelStyle: TextStyle(color: mainThemeColor),
                        //fillColor: mainThemeColor
                      ),
                    ),
                  ),
                ),
                // password input
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Container(
                    decoration: BoxDecoration(
                        //border: Border.all(color: mainThemeColor)
                        ),
                    child: TextField(
                      obscureText: true,
                      onChanged: (String str) {
                        setState(() {
                          password = str;
                        });
                      },
                      //style: TextStyle(color: mainThemeColor),
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: mainThemeColor)
                            ),
                        focusedBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: mainThemeColor)
                            ),
                        disabledBorder: OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors.red)
                            ),
                        hintText: '****',
                        labelText: 'Password',
                        //hintStyle: TextStyle(color: mainThemeColor),
                        //labelStyle: TextStyle(color: mainThemeColor),
                        //fillColor: mainThemeColor
                      ),
                    ),
                  ),
                ),
                // sign in button
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        print('login onTap');
                        // validate username and password
                        //if(this.username == null || username = "" || password == null || password = ""){

                        //}
                        if (username == "" ||
                            password == "" ||
                            username == null ||
                            password == null) {
                          print('invalid input value');
                          return;
                        }
                        loginAccount(
                            username: username!,
                            password: password!,
                            context: context);
                      },
                      child: Container(
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(85, 38, 38, 1),
                                Color.fromRGBO(85, 38, 38, 1),
                              ]),
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 15,
                                color: mainThemeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            // don't have an account, register here
            /*   Container(
              //height: size.height /6,
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(mainThemeColor),
                    ),
                    icon: Icon(Icons.school_outlined, color: Colors.black),
                    label: Text(
                      'Enroll Now',
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      Get.toNamed(EnrollFormRoute.routeName);
                      //Get.pushNamed(context, EnrollFormRoute.routeName);
                    },
                  ),
                  SizedBox(width: 50),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(mainThemeColor),
                    ),
                    icon: Icon(Icons.phone_outlined, color: Colors.black),
                    label: Text(
                      'Contact Us',
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () => launch("tel://09794664377"),
                  ),
                ],
              ),
            ),
           */ // login status
          ],
        ),
      ),
    );
  }

  void forgetPassword(BuildContext context) {
    print('forgetPassword is called');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: mainThemeColor,
      content: TextButton.icon(
        icon: Icon(Icons.phone, color: Colors.black),
        label: Text(
          'Contact Us',
          style: const TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        onPressed: () => launch("tel://09794664377"),
      ),
    ));
  }

  void registerAccount(BuildContext context) {
    print('registerAccount is called');

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: mainThemeColor,
      content: TextButton.icon(
        icon: Icon(Icons.phone, color: Colors.black),
        label: Text(
          'Enroll Now',
          style: const TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        onPressed: () async {
          Navigator.pushNamed(context, EnrollFormRoute.routeName);
        },
      ),
    ));

    // Navigator.pushNamed(context, SignUpRoute.routeName);
  }

  void loginAccount(
      {required String username,
      required String password,
      required BuildContext context}) async {
    print('loginAccount is called with username $username, password $password');

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("signing in..."),
    ));
    //Navigator.pushNamedAndRemoveUntil(context, MainRoute.routeName, (route) => false);
    print("signing in START");
    User user = await Provider.of<UserProvider>(context, listen: false)
        .login(username: username, password: password);
    print("signing in END");
    print(user);
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("❌ Login Fail ❌ "),
      ));
    } else {
      Navigator.pushReplacementNamed(context, MainRoute.routeName);
    }
  }
}

class CustomCardShapePainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter({required this.startColor, required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double radius = 24;
    Paint paint = Paint();
    paint.shader =
        ui.Gradient.linear(Offset(0, size.height), Offset(size.width, 0), [
      //HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      startColor,
      endColor
    ]);

    final double w = size.width;
    final double h = size.height;
    final pointOneX = -w * 0.2;
    final pointOneY = h * 0.4;

    final pointTwoX = w * 0.4;
    final pointTwoY = h * 0.5;

    final pointThreeX = w * 0.7;
    final pointThreeY = h * 0.6;

    final pointFourX = w * 0.7;
    final pointFourY = h * 0.7;

    final pointFiveX = w * 0.7;
    final pointFiveY = h * 0.9;

    final pointSixX = w * 1.0;
    final pointSixY = h * 1.0;

    Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(pointOneX, pointOneY, pointTwoX, pointTwoY)
      ..quadraticBezierTo(pointThreeX, pointThreeY, pointFourX, pointFourY)
      ..quadraticBezierTo(pointFiveX, pointFiveY, pointSixX, pointSixY)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      /*
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
       */
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return true;
  }
}

class AppLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/logotext.png'),
      fit: BoxFit.fitWidth,
    );
  }
}
