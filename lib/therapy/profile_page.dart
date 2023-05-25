
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFFEAE1D7),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            //Profile Avatar
            //Email
            //User Name or Null
            //Logout if authenticated (or) Google signin/Apple signin
            
          ],
        ),
      ),
    );
  }
}