import 'package:flutter/material.dart';
import 'package:kzn/data/models/checkbox_model.dart';

final String appName = "His's and Her's Fashion School";
// production server http://13.213.196.157:8000 2021-10-08 Updated
// development server http://192.168.1.2:8000
// http://127.0.0.1:8000/
// final String backendApiServer = 'http://52.47.195.138:8081';
final String backendApiServer = 'http://54.255.6.150:8081';
final String apiVersion = backendApiServer + '';
final String loginEndpoint = apiVersion + '/api/token/';
final String courseEndpoint = apiVersion + '/courses/?limit=100';
final String subscriptionEndpoint = apiVersion + '/subscriptions/';

final String appIconAsset = "assets/logo.png";
final String appIconUrl = "https://grace.sgp1.cdn.digitaloceanspaces.com/logo.png";

final Color tileColor = Colors.yellow;
final Color? iconColor = Colors.indigo[900];

final String fbProtocolUrl = "fb://page/432554843785776";
final String fallbackUrl = "https://www.facebook.com/selfmasterywithkhit";

final List<String> introSliderImages = [
  "assets/1.jpg",
  "assets/2.jpg",
  "assets/3.jpg",
  "assets/4.jpg",
  "assets/1.jpg",
];

const List<String> courseNameList = [
  "Ready To Wear Basic Outfit Batch 2",
  "Fashion Illustration Online Training",
  "Baby Wear Online Class",
  "Polo Shirt & T Shirt Online Class",
  "Men Wear Wedding Suit Online Class",
  "Master of Myanmar Blouse Online Class",
  "Ready - Made Pant Online Training Course",
  "Readymade Coat & Jacket Online Class",
  "Ready To Wear Basic Outfit Course Online Class",
  "Readymade Crop Top Online Class",
  "Myanmar Basic Blouse & Longyi Course Online Class",
  "Ready - Made Corset & Bra Online Class",
  "Ready Made Advanced Online Class",
];
/*List<CheckboxModel> courseList = [
  CheckboxModel(
      courseTitle: "Ready To Wear Basic Outfit Batch 2", isSelected: false),
  CheckboxModel(
      courseTitle: "Fashion Illustration Online Training", isSelected: false),
  CheckboxModel(courseTitle: "Baby Wear Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Polo Shirt & T Shirt Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Men Wear Wedding Suit Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Master of Myanmar Blouse Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Ready - Made Pant Online Training Course",
      isSelected: false),
  CheckboxModel(
      courseTitle: "Readymade Coat & Jacket Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Ready To Wear Basic Outfit Course Online Class",
      isSelected: false),
  CheckboxModel(
      courseTitle: "Readymade Crop Top Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Myanmar Basic Blouse & Longyi Course Online Class",
      isSelected: false),
  CheckboxModel(
      courseTitle: "Ready - Made Corset & Bra Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Ready Made Advanced Online Class", isSelected: false),
];*/

final List<String> paymentAccList = [
  "246 301 246 0034 6201 (KBZ Bank)",
  "099 6790 6768 (KBZ Pay)",
  "09 79 466 4377 (Wave Pay)",
  "200 241 49 231 (AYA Bank)",
  "099 6790 6768 (AYA Pay)",
];

const Map<String, dynamic> paymentAccMap = {
  "1": "246 301 246 0034 6201 (KBZ Bank)",
  "2": "099 6790 6768 (KBZ Pay)",
  "3": "09 79 466 4377 (Wave Pay)",
  "4": "200 241 49 231 (AYA Bank)",
  "5": "099 6790 6768 (AYA Pay)",
};

//Theme
const inputLabel = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);
const courseLabel = TextStyle(
  color: Colors.black,
  fontSize: 15,
);
const formBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

const enrollCollection = "enrollCollection";
const courseCollection = "courseCollection";