import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/expert.dart';
import 'booking.dart';

class DetailPage extends StatelessWidget {
  final ExpertModel expertModel;
  const DetailPage({Key? key, required this.expertModel}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 800;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Hero(
              //   tag: expertModel.photolink,
              //   child: CachedNetworkImage(
              //     imageUrl: expertModel.photolink,
              //     width: double.infinity,
              //     height: 280,
              //     fit: BoxFit.fill,
              //
              //   ),
              // ),


              Positioned(
                top: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                    ),
                    children: [
                      Hero(
                        tag: expertModel.photolink,
                        child: CachedNetworkImage(
                          imageUrl: expertModel.photolink,
                          width: double.infinity,
                          height: isTablet ? 835 : 390,
                          fit: BoxFit.contain,

                        ),
                      ),
                       ListView(
                          padding: EdgeInsets.all(20),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Text(
                              expertModel.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 1,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text(
                                              "💼 Category",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),


                                            Text(
                                              expertModel.type,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  width: 50,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "✨ Related Course",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Text(
                                      expertModel.job,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),





                            SizedBox(height: 20,),


                            Text(
                              expertModel.description,
                            ),
                            SizedBox(
                              height: 20,
                            ),





                            Container(
                              width: double.infinity,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "💰 Price",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        expertModel.rate,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "⏰ Time",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        expertModel.rating,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "☎️ Contact",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        expertModel.rating2,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: expertModel.photolink2,

                                      // width: 150,
                                      width: isTablet ? 225 : 150,
                                      height: isTablet ? 300 : 200,
                                      // height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text("💼 Services", style: TextStyle(fontSize: 16,
                                      //     fontWeight: FontWeight.bold),),
                                      Text(expertModel.jobTitle),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Text(
                                      //   expertModel.jobDescription,
                                      //   maxLines: 20,
                                      //   overflow: TextOverflow.ellipsis,
                                      // ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: expertModel.photolink3,
                                    width: isTablet ? 225 : 150,
                                    height: isTablet ? 300 : 200,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text(expertModel.jobTitle),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Text(
                                        expertModel.jobDescription,
                                        maxLines: 20,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Text(
                              "📖  Remark",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),

                            Text(expertModel.propertyAddress),

                        SizedBox(
                          height: 100),



                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: SafeArea(
                  child: IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ],
          ),
        ),

        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.black,
        //   onPressed: () {
        //     Get.to(
        //       BookingPage(expertModel: expertModel),
        //     );
        //   },
        //   child: Icon(Icons.schedule_outlined),
        // ),







        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.to(
              BookingPage(expertModel: expertModel),
            );
          },
          child: SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Text(
                        expertModel.rating,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        expertModel.rate,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),





                Container(




                  margin: EdgeInsets.only( right: 30, bottom: 5),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                          width: 3.0),   // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: [BoxShadow(blurRadius: 5,color: Colors.black,offset: Offset(1,1))] // Make rounded corner of border
                  ),
                  child: Text("🗓️  Booking Now", style: TextStyle(
                    color: Colors.black, fontSize: 14
                  ),),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
