import 'dart:math';
import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:kzn/data/constant.dart';

import '../../affirmations/widgets/widgets.dart';
import '../controller/home_controller.dart';
import '../model/expert.dart';
import '../routes/routes.dart';
import '../screen/detail.dart';

class GeneralCard extends StatelessWidget {
  final ExpertModel expertModel;
  const GeneralCard({Key? key, required this.expertModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          DetailPage.routeName,
          arguments: expertModel,
        );
        /* Navigator.of(context).push(route(DetailPage(
          expertModel: expertModel,
        ))); */
      },
      child: Container(
        width: 180,
        child: Card(
          color: mainThemeColor,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: LayoutBuilder(builder: (context, constraints) {
                        developer.log(
                            "General Card's height: ${constraints.maxHeight} \n width: ${constraints.maxWidth}");
                        return Hero(
                          tag: expertModel.photolink,
                          child: CachedNetworkImage(
                            cacheKey: expertModel.photolink,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            imageUrl: expertModel.photolink,
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    expertModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  final ExpertModel expertModel;
  const SearchCard({Key? key, required this.expertModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(DetailPage.routeName, arguments: expertModel);
      },
      child: Container(
        width: double.infinity,
        height: 120,
        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: expertModel.photolink,
                    width: 130,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expertModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        expertModel.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Area",
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
                                expertModel.job,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Price",
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
                                expertModel.rate,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Bed Room",
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
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
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

class CheckOutCard extends StatefulWidget {
  final String id;
  final ExpertModel expertModel;
  const CheckOutCard(
      {required Key key, required this.id, required this.expertModel})
      : super(key: key);

  @override
  State<CheckOutCard> createState() => _CheckOutCardState();
}

class _CheckOutCardState extends State<CheckOutCard> {
  final HomeController _home = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          DetailPage.routeName,
          arguments: widget.expertModel,
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 5,
          child: SwipeActionCell(
            key: widget.key!,
            trailingActions: [
              SwipeAction(
                  title: "Cancel",
                  onTap: (CompletionHandler handler) async {
                    handler(true);
                    await _home.deleteBooking(widget.id);
                    setState(() {});
                  },
                  color: Colors.amber),
            ],
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: widget.expertModel.photolink,
                      width: 100,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.expertModel.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.expertModel.type,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Area",
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
                                  widget.expertModel.job,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Price",
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
                                  widget.expertModel.rate,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Bed Room",
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
                                  widget.expertModel.rating,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ManageCard extends StatefulWidget {
  final ExpertModel expertModel;
  const ManageCard({required Key key, required this.expertModel})
      : super(key: key);

  @override
  State<ManageCard> createState() => _ManageCardState();
}

class _ManageCardState extends State<ManageCard> {
  final HomeController _home = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 5,
        child: SwipeActionCell(
          key: widget.key!,
          trailingActions: [
            SwipeAction(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
              onTap: (CompletionHandler handler) async {
                handler(true);
                await _home.deleteExpert(widget.expertModel.id!);

                ///ToDo
                setState(() {});
              },
              color: Colors.red,
            ),
            SwipeAction(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onTap: (CompletionHandler handler) async {
                handler(false);
                _home.setEditExpertId(widget.expertModel.id!);
                Get.toNamed(createExpertPage);

                ///ToDo
                setState(() {});
              },
              color: Colors.amber,
            ),
          ],
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: widget.expertModel.photolink,
                    width: 120,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.expertModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.expertModel.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Area",
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
                                widget.expertModel.job,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Price",
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
                                widget.expertModel.rate,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Type",
                          //       style: TextStyle(
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Text(
                          //       widget.expertModel.rating,
                          //       style: TextStyle(
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black,
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      )
                    ],
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
