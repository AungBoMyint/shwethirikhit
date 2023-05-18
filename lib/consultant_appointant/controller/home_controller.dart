import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../affirmations/models/music.dart';
import '../../model/therapy_video.dart';
import '../../model/type.dart';
import '../../model/vlog_video.dart';
import '../../services/database/query.dart';
import '../../services/database/reference.dart';
import '../data/constant.dart';
import '../model/expert.dart';
import '../model/purchase.dart';
import '../model/user.dart';
import '../service/auth.dart';
import '../service/database.dart';
import '../../model/category.dart';

class HomeController extends GetxController {
  final Auth _auth = Auth();
  final Database _database = Database();
  //--All Data List
  final RxList<Category> homeCategories = <Category>[].obs;
  final RxList<Category> affirmationsCategories = <Category>[].obs;
  final RxList<Category> therapyCategories = <Category>[].obs;
  final RxList<ItemType> homeTypes = <ItemType>[].obs;
  final RxList<ItemType> affirmationsTypes = <ItemType>[].obs;
  final RxList<ExpertModel> experts = <ExpertModel>[].obs;
  final RxList<Music> musics = <Music>[].obs;
  final RxList<VlogVideo> vlogVideos = <VlogVideo>[].obs;
  final RxList<TherapyVideo> therapyVideos = <TherapyVideo>[].obs;
  //---------//
  final RxBool authorized = false.obs;
  final Rx<AuthUser> user = AuthUser().obs;

  final RxBool phoneState = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  final List<ExpertModel> viewAllModel = [];

  final RxString _codeSentId = ''.obs;
  final RxInt _codeSentToken = 0.obs;

  Future<void> login() async {
    try {
      if (_codeSentId.value.isNotEmpty || phoneState.value) {
        await confirm();
        return;
      }
      await _auth.login(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          _codeSentId.value = verificationId;
          _codeSentToken.value = forceResendingToken ?? 0;
          update([_codeSentId, _codeSentToken]);
        },
        verificationFailed: (FirebaseAuthException error) {},
      );
      phoneState.value = true;
    } catch (e) {
      print("login error $e");
    }
  }

  Future<void> confirm() async {
    try {
      await _auth.loginWithCerdential(PhoneAuthProvider.credential(
        verificationId: _codeSentId.value,
        smsCode: verificationController.text,
      ));
      _codeSentId.value = '';
      phoneState.value = false;
      phoneController.clear();
      verificationController.clear();
    } catch (e) {
      print("confirm error is $e");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.logout();
    } catch (e) {
      print("logout error is $e");
    }
  }

  // Future<void> uploadProfile() async {
  //   try {
  //     final XFile? _file =
  //         await _imagePicker.pickImage(source: ImageSource.gallery);

  //     if (_file != null) {
  //       await _api.uploadFile(
  //         _file.path,
  //         fileName: user.value.user?.uid,
  //         folder: profileUrl,
  //       );
  //       await _database.write(
  //         expertCollection,
  //         data: {
  //           'link': user.value.user?.uid,
  //         },
  //         path: user.value.user?.uid,
  //       );
  //       user.value.update(
  //         newProfileImage: '$baseUrl$profileUrl${user.value.user?.uid}',
  //       );
  //       update([user]);
  //     }
  //   } catch (e) {
  //     print("profile upload error $e");
  //   }
  // }

  @override
  void onInit() {
    super.onInit();

    // Minim commodo sit eiusmod sunt ea ex. Laborum elit duis ullamco dolore. Cillum duis quis aute consequat eu ut id anim occaecat commodo consectetur minim tempor qui. In consectetur adipisicing deserunt aliqua labore.

// Lorem aliquip nostrud laboris esse eu proident eu sit consectetur commodo sint. Sit commodo ut amet cillum. Consectetur occaecat aliquip consectetur cillum.

// Deserunt anim nisi esse pariatur exercitation esse quis quis et sunt magna aliqua. Nulla nisi commodo nulla et magna labore duis culpa esse duis reprehenderit aute id irure. Do est adipisicing laboris tempor duis ipsum.

    _auth.onAuthChange().listen((_) async {
      if (_ == null) {
        authorized.value = false;
        user.value = AuthUser();
      }
      if (_ != null) {
        ///To create admin role
        await _database.write(
          userCollection,
          path: _.uid,
          data: {
            'uid': _.uid,
            'role': 'admin',
          },
        );
        final DocumentSnapshot<Map<String, dynamic>> _userData =
            await _database.read(userCollection, path: _.uid);
        authorized.value = true;
        user.value = AuthUser(
          user: _,
          isAdmin: _userData.data()?['role'] == 'admin',
        );

        if (user.value.isAdmin) getAdminPurchase;
        getMyPurchase;
      }
    });

    _vlogVideoListener();
    _homeCategoryListener();
    _affirmationsCategoryListener();
    _therapyCategoryListener();
    _homeTypeListener();
    _affirmationsTypeListener();
    _expertsListener();
    _musicListener();
    _therapyVideoListener();
  }

  _homeCategoryListener() => homeCategoryQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          homeCategories.clear();
        } else {
          homeCategories.value = event.docs.map((e) => e.data()).toList();
        }
      });
  _affirmationsCategoryListener() =>
      affirmationsCategoryQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          affirmationsCategories.clear();
        } else {
          affirmationsCategories.value =
              event.docs.map((e) => e.data()).toList();
        }
      });

  _homeTypeListener() => homeTypeQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          homeTypes.clear();
        } else {
          homeTypes.value = event.docs.map((e) => e.data()).toList();
        }
      });

  _affirmationsTypeListener() =>
      affirmationsTypeQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          affirmationsTypes.clear();
        } else {
          affirmationsTypes.value = event.docs.map((e) => e.data()).toList();
        }
      });

  _musicListener() => musicQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          musics.clear();
        } else {
          musics.value = event.docs.map((e) => e.data()).toList();
        }
      });

  _vlogVideoListener() => vlogVideoQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          vlogVideos.clear();
        } else {
          vlogVideos.value = event.docs.map((e) => e.data()).toList();
        }
      });

  _therapyVideoListener() => therapyVideoQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          therapyVideos.clear();
        } else {
          therapyVideos.value = event.docs.map((e) => e.data()).toList();
        }
      });

  _therapyCategoryListener() =>
      therapyCategoryQuery.snapshots().listen((event) {
        if (event.docs.isEmpty) {
          therapyCategories.clear();
        } else {
          therapyCategories.value = event.docs.map((e) => e.data()).toList();
        }
      });

  final RxList<ExpertModel> _searchExperts = <ExpertModel>[].obs;

  final RxString expertId = ''.obs;

  void setEditExpertId(String id) => expertId.value = id;

  List<ExpertModel> getAllExpert() =>
      _searchExperts.isEmpty ? experts : _searchExperts;

  List<ExpertModel> getSearchExpert() =>
      _searchExperts.isEmpty ? experts : _searchExperts;

  void searchExpert(String e) => _searchExperts.value = experts
      .where(
        (p0) => p0.name.toLowerCase().contains(e.toLowerCase()),
      )
      .toList();

  ExpertModel getExpert(String id) {
    try {
      return experts.firstWhere(
        (p0) => p0.id == id,
      );
    } catch (e) {
      return ExpertModel(
        photolink: '',
        photolink2: '',
        photolink3: '',
        name: '',
        type: '',
        description: '',
        job: '',
        rate: '',
        rating: '',
        rating2: '',
        jobTitle: '',
        jobDescription: '',
        propertyAddress: '',
      );
    }
  }

  void disposeSearch() => _searchExperts.clear();

  List<ExpertModel> getByType(String type) => experts.where((p0) {
        return p0.type == type;
      }).toList();

  List<Music> getMusicByType(String typeID) =>
      musics.where((p0) => p0.type == typeID).toList();
  List<Music> getMusicByCategory(String categoryID) =>
      musics.where((p0) => p0.categoryID == categoryID).toList();

  List<TherapyVideo> getTherapyVideoByCategory(String categoryID) {
    final list = therapyVideos.where((v) => v.parentID == categoryID).toList();
    debugPrint("TherapyVideoList: ${list.length}");
    return list;
  }

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

  StreamSubscription _expertsListener() =>
      expertsCollection().snapshots().listen((event) {
        if (event.docs.isEmpty) {
          experts.clear();
        } else {
          log("****Experts Length: ${experts.length}");
          experts.value = event.docs.map((e) => e.data()).toList();
        }
      });

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

  StreamSubscription get getMyPurchase => _database
          .watchWhere(
        purchaseCollection,
        user.value.user!.uid,
      )
          .listen((event) {
        if (event.docs.isEmpty) {
          myPurchase.clear();
        } else {
          myPurchase.value = event.docs
              .map((e) => PurchaseModel.fromJson(e.data(), e.id))
              .toList();
        }
      });

  final RxList<PurchaseModel> _adminPurchase = <PurchaseModel>[].obs;

  final RxList<PurchaseModel> _searchPurchse = <PurchaseModel>[].obs;

  List<PurchaseModel> getPurchase() =>
      _searchPurchse.isEmpty ? _adminPurchase : _searchPurchse;

  void searchPurchse(String e) => _searchPurchse.value = _adminPurchase
      .where(
        (p0) =>
            p0.dateTime.toLowerCase().contains(e.toLowerCase()) ||
            p0.username.toLowerCase().contains(e.toLowerCase()) ||
            getExpert(p0.expertId).name.toLowerCase().contains(e) ||
            p0.phone.toLowerCase() == e.toLowerCase() ||
            p0.address.toLowerCase().contains(e),
      )
      .toList();

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
