import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kzn/auth/view/auth_page.dart';
import 'package:kzn/auth/view/sms_page.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/consultant_appointant/screen/detail.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/providers/subscription_provider.dart';
import 'package:kzn/providers/user_provider.dart';
import 'package:kzn/therapy/profile_page.dart';
import 'package:kzn/ui/routes/about_route.dart';
import 'package:kzn/ui/routes/course_route.dart';
import 'package:kzn/ui/routes/login_route.dart';
import 'package:kzn/ui/routes/main_route.dart';
import 'package:kzn/ui/routes/privacy-policy.dart';
import 'package:kzn/ui/routes/subscription_check_route.dart';
import 'package:kzn/ui/routes/subscription_route.dart';
import 'package:kzn/ui/routes/tnc_route.dart';
import 'package:kzn/utils/fun.dart';
import 'package:kzn/utils/utils.dart';
import 'package:kzn/vlog/vlog_controller.dart';
import 'package:provider/provider.dart';
import 'affirmations/controller/aff_home_controller.dart';
import 'auth/controller/auth_controller.dart';
import 'intro/intro_one_screen.dart';
import 'therapy/therapy_controller.dart';
import 'ui/routes/enroll_form_route.dart';
import 'package:kzn/bottombar.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } on FirebaseException catch (e) {
    log("***FirebaseError: $e");
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await Hive.initFlutter();
  await Hive.openBox(LOGIN_BOX);
/*   await FirebaseMessaging.instance.subscribeToTopic('advertisement');
 */
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
        // ChangeNotifierProvider(create: (_) => VlogProvider()),
      ], child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Get.put(MainController());  */ //Make Globle,

    Get.put(HomeController());
    Get.put(VlogController());
    Get.put(AuthController());
    Get.put(TherapyController());
    Get.put(AffHomeController());
    return GetMaterialApp(
        navigatorKey: globalKey,
        debugShowCheckedModeBanner: false,
        title: "Shwe Thiri Khit",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /*  builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 415, name: MOBILE),
                const Breakpoint(start: 416, end: 524, name: TABLET),
                const Breakpoint(start: 525, end: 800, name: "LTABLET"),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ), */
        //home: IntroOneScreen(),
        initialRoute: getInitialRoute(),
        routes: {
          IntroOneScreen.routeName: (context) => IntroOneScreen(),
          AuthPage.routeName: (context) => AuthPage(),
          SMSPage.routeName: (context) => SMSPage(),
          ProfilePage.routeName: (context) => ProfilePage(),
          MainRoute.routeName: (context) => BottomBar(),
          LoginRoute.routeName: (context) => LoginRoute(),
          SubscriptionRoute.routeName: (context) => SubscriptionRoute(),
          CourseRoute.routeName: (context) => CourseRoute(),
          AboutRoute.routeName: (context) => AboutRoute(),
          TnCRoute.routeName: (context) => TnCRoute(),
          EnrollFormRoute.routeName: (context) => EnrollFormRoute(),
          PrivacyPolicyRoute.routeName: (context) => PrivacyPolicyRoute(),
          SubscriptionCheckRoute.routeName: (context) =>
              SubscriptionCheckRoute(),
          DetailPage.routeName: (context) => DetailPage(),
        });
  }
}
