import 'package:flutter/material.dart';

class AboutRoute extends StatefulWidget {
  static final String routeName = "/about_route";
  @override
  _AboutRouteState createState() => _AboutRouteState();
}

class _AboutRouteState extends State<AboutRoute> {
  final Color tileColor = Colors.redAccent;
  final Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("About", style: TextStyle(fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black
        )),),
      // appBar: AppBar(title: Text("About")),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: SingleChildScrollView(child: Text(
            '''
         His's and Her's Fashion Design School was founded as Fashion Illustration school on April, 2018. 
          
Approved as the Fashion Design School in Myanmar in 2018, the School has produced about 500 alumni, and has played a significant role in fashion education in Myanmar for about 3 years.

His's and Her's Fashion Design School is situated in Yangon, Myanmar. 

The School is a gathering place for Fashion industry, providing access to information on the latest fashion trends around the world.

His's and Her's Fashion Design School has produced many great Fashion designers and Illustrators working on the world stage. 

We have helped raise Myanmar fashion to the world’s top level, and continue to send out talent to the forefront of the fashion world.
          '''
        )),
      ),

    );
  }
}


