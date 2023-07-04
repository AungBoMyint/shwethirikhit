import 'package:hive/hive.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/intro/intro_one_screen.dart';
import 'package:kzn/ui/routes/main_route.dart';

String getInitialRoute() {
  final box = Hive.box(LOGIN_BOX);
  if (box.get(AUTH_KEY, defaultValue: false) == true) {
    return MainRoute.routeName;
  } else {
    return IntroOneScreen.routeName;
  }
}
