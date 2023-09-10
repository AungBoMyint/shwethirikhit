import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/auth/widgets/prompt_delete_account.dart';
import 'package:kzn/utils/extensions.dart';
import 'package:kzn/utils/utils.dart';

import '../data/constant.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "profile_page";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFFEAE1D7),
        elevation: 0,
        iconTheme: IconThemeData(
          color: secondMainThemeColor,
        ),
      ),
      body: Obx(() {
        final profile = _authController.currentUser.value?.avatar;
        final email = _authController.currentUser.value?.email;
        final phone = _authController.currentUser.value?.phone;
        final name = _authController.currentUser.value?.name;
        return Center(
          child: Column(
            children: [
              verticalSpace(25),
              //Profile Avatar

              profile == null
                  ? CircleAvatar(
                      backgroundColor: mainThemeColor,
                      backgroundImage: AssetImage('assets/user.png'),
                      radius: 100,
                      /* child: changeIconWidget(), */
                    )
                  : CircleAvatar(
/*                       backgroundColor: Colors.white,
 */
                      foregroundImage: NetworkImage(profile),
                      radius: 100,
                      /* child: changeIconWidget(), */
                    ),
              verticalSpace(25),
              Text(
                name ?? "",
                style: TextStyle(
                  color: secondMainThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(25),
              //Email or Phone
              Text(
                email ?? phone ?? "",
                style: TextStyle(
                  color: secondMainThemeColor,
                ),
              ),
              verticalSpace(25),

              ElevatedButton(
                onPressed: () => _authController.logout(),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Logout",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ).withColor(mainColor),
              verticalSpace(10),
              ElevatedButton(
                onPressed: () => promptDeleteAccount(context),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Delete Account",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ).withColor(Colors.red),
            ],
          ),
        );
      }),
    );
  }
}

changeIconWidget() {
  return CircleAvatar(
    backgroundColor: secondMainThemeColor.withOpacity(0.5),
    radius: 80,
    child: Center(
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
    ),
  );
}
