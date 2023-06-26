import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/vlog_video.dart';
import '../../services/database/query.dart';
import '../data/constant.dart';
import '../model/expert.dart';
import '../model/purchase.dart';
import '../service/auth.dart';
import '../service/database.dart';

class HomeController extends GetxController {
  var currentIndex = 1.obs;
  final Auth _auth = Auth();
  final Database _database = Database();
  final RxList<VlogVideo> vlogVideos = <VlogVideo>[].obs;

  final RxBool authorized = false.obs;

  final RxBool phoneState = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  final List<ExpertModel> viewAllModel = [];

  final RxString _codeSentId = ''.obs;
  final RxInt _codeSentToken = 0.obs;
  void changeCurrentIndex(int v) => currentIndex.value = v;
  @override
  void onInit() {
    super.onInit();

    _vlogVideoListener();
  }

  _vlogVideoListener() => vlogVideoQuery.snapshots().listen((event) async {
        if (event.docs.isEmpty) {
          vlogVideos.clear();
        } else {
          vlogVideos.value = await compute(parseVlogVideos, event.docs);
        }
      });

  FutureOr<List<VlogVideo>> parseVlogVideos(
      List<QueryDocumentSnapshot<VlogVideo>> message) {
    return message.map((e) => e.data()).toList();
  }

  final RxList<ExpertModel> _searchExperts = <ExpertModel>[].obs;

  final RxString expertId = ''.obs;

  void setEditExpertId(String id) => expertId.value = id;

  void disposeSearch() => _searchExperts.clear();

  Future<void> deleteExpert(String id) async {
    if (isloading.value) return;
    isloading.value = true;
    try {
      await _database.delete(expertCollection, path: id);
    } catch (e) {
      print(e);
    }
    isloading.value = false;
  }

  ///is loading
  final RxBool isloading = false.obs;

  ///date
  final Rx<DateTime> bookingDate = DateTime.now().obs;

  void setBookingDate(DateTime dateTime) {
    bookingDate.value = dateTime;
  }

  ///time
  final Rx<TimeOfDay> bookingTime = TimeOfDay.now().obs;

  void setBookingTime(TimeOfDay timeOfDay) {
    bookingTime.value = timeOfDay;
  }

  final Rx<String> address = ''.obs;

  final Rx<String> name = ''.obs;

  final Rx<String> phone = ''.obs;

  void setAddress(String data) {
    address.value = data;
  }

  void setName(String data) {
    name.value = data;
  }

  void setPhone(String data) {
    phone.value = data;
  }

  Future<void> booking(String id) async {
    if (isloading.value) return;
    isloading.value = true;
    try {
      _database
          .write(
        purchaseCollection,
        data: PurchaseModel(
          dateTime:
              "${bookingDate.value.year}/${bookingDate.value.month}/${bookingDate.value.day}",
          timeOfDay: "${bookingTime.value.hour}:${bookingTime.value.minute}",
          address: address.value,
          username: name.value,
          phone: phone.value,
          expertId: id,
          userId: "",
        ).toJson(),
      )
          .then((value) {
        Get.back();
        Get.back();
        // Navigator.popUntil(Get.context!, ModalRoute.withName(MainRoute.routeName));
        Get.snackbar('Booking Status', 'Your booking has been confirmed');

        // Navigator.popUntil(Get.context!, ModalRoute.withName(MainRoute.routeName));
      });

      //Future.delayed(const Duration(seconds: 2),() => Get.back())// Get.back();
    } catch (e) {
      print(e);
    }
    setBookingDate(DateTime.now());
    setBookingTime(TimeOfDay.now());
    setAddress('');
    setPhone('');
    setName('');
    isloading.value = false;
  }

  Future<void> deleteBooking(String id) async {
    if (isloading.value) return;
    isloading.value = true;
    try {
      await _database.delete(purchaseCollection, path: id);
    } catch (e) {
      print(e);
    }
    isloading.value = false;
  }

  ///my booking
  final RxList<PurchaseModel> myPurchase = <PurchaseModel>[].obs;

  final RxList<PurchaseModel> _adminPurchase = <PurchaseModel>[].obs;

  final RxList<PurchaseModel> _searchPurchse = <PurchaseModel>[].obs;

  List<PurchaseModel> getPurchase() =>
      _searchPurchse.isEmpty ? _adminPurchase : _searchPurchse;

  StreamSubscription get getAdminPurchase => _database
          .watch(
        purchaseCollection,
      )
          .listen((event) {
        if (event.docs.isEmpty) {
          _adminPurchase.clear();
        } else {
          _adminPurchase.value = event.docs
              .map((e) => PurchaseModel.fromJson(e.data(), e.id))
              .toList();
        }
      });
}
