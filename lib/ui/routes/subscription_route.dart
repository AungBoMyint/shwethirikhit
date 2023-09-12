import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/image.dart';
import 'enroll_form_route.dart';

class SubscriptionRoute extends StatefulWidget {
  static const routeName = '/subscription_route';
  @override
  _SubscriptionRouteState createState() => _SubscriptionRouteState();
}

class _SubscriptionRouteState extends State<SubscriptionRoute> {
  @override
  Widget build(BuildContext context) {
    log("Width: ${MediaQuery.of(context).size.width}");
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: mainThemeColor,
          title: Text("သင်တန်းအပ်ရန်",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Colors.black)),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('assets/logotext.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
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
                    'သင်တန်းအပ်ရန်',
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: () async {
                    try {
                      await launch('https://m.me/selfmasterywithkhit');
                    } catch (e) {
                      print(e);
                    }
                  },
                ),

                /*   ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
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
                 */
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Center(
                child: Text(
              '''ယခု သင်တန်း၏ သင်ခန်းစာများ လေ့လာနိုင်ရန် သင်တန်းအပ်ရန် ကို နှိပ်ပြီး သင်တန်း အပ်နိုင်သလို သိရှိလိုသမျှကို မေးမြန်းနိုင်ပါတယ်ရှင်''',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),

      // floatingActionButton: AppFab(),
    );
  }
}
