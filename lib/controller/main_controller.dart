import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kzn/services/database/database.dart';
import '../affirmations/models/music.dart';
import '../consultant_appointant/model/expert.dart';
import '../model/type.dart';
import '../model/category.dart';
import '../model/vlog_video.dart';
import '../services/database/reference.dart';

class MainController extends GetxController {
  final Database database = Database(); //Dependencies Injection

  Future<void> importCategoryJson() async {
    log("******Writing category");
    try {
      String jsonString =
          await rootBundle.loadString('assets/dummy/category.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<Category> categories =
          jsonData.map((e) => Category.fromJson(e)).toList();

      for (var element in categories) {
        await categoryDocument(element.id).set(element);
      }
      log("******finish category");
    } catch (e) {
      log("Category Document Error: $e");
    }
  }

  Future<void> importAllData() async {
    await importAffirmationsCategoryJson();
  }

  ///Import VlogVideo
  Future<void> importVlogVideoJson() async {
    debugPrint("******Writing Vlog Video");
    try {
      String jsonString =
          await rootBundle.loadString('assets/dummy/vlog_video.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<VlogVideo> categories =
          jsonData.map((e) => VlogVideo.fromJson(e)).toList();
      final batch = FirebaseFirestore.instance.batch();
      for (var element in categories) {
        batch.set(vlogVideoDocument(element.id), element);
      }
      await batch.commit();
      debugPrint("******finish Vlog Video");
    } catch (e) {
      debugPrint("Vlog Video Document Error: $e");
    }
  }

  //Import HomeType
  Future<void> importHomeTypeJson() async {
    debugPrint("******Writing home type");
    try {
      String jsonString =
          await rootBundle.loadString('assets/dummy/home_type.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<ItemType> categories =
          jsonData.map((e) => ItemType.fromJson(e)).toList();
      final batch = FirebaseFirestore.instance.batch();
      for (var element in categories) {
        batch.set(homeTypeDocument(element.id), element);
      }
      await batch.commit();
      debugPrint("******finish home type");
    } catch (e) {
      debugPrint("Home Type Document Error: $e");
    }
  }

  ///Import Home Type Data
/*   Future<void> importHomeTypeDataJson() async {
    log("******Writing home type data");
    try {
      String jsonString =
          await rootBundle.loadString('assets/dummy/home_type_data.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<ExpertModel> categories =
          jsonData.map((e) => ExpertModel.fromJson(e)).toList();
      final batch = FirebaseFirestore.instance.batch();
      for (var element in categories) {
        batch.set(expertsDocument(element.id!), element);
      }
      await batch.commit();
      log("******finish home type data");
    } catch (e) {
      log("Home Type Data Document Error: $e");
    }
  }
 */
  ///Import Affirmations Category
  Future<void> importAffirmationsCategoryJson() async {
    debugPrint("******Writing affirmations category");
    try {
      String jsonString = await rootBundle
          .loadString('assets/dummy/affirmations_category.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<Category> categories =
          jsonData.map((e) => Category.fromJson(e)).toList();
      final batch = FirebaseFirestore.instance.batch();
      for (var element in categories) {
        batch.set(categoryDocument(element.id), element);
      }
      await batch.commit();
      debugPrint("******finish affirmations category");
    } catch (e) {
      debugPrint("Affirmations Category Document Error: $e");
    }
  }

  //types
  Future<void> importAffirmationTypeJson() async {
    debugPrint("******Writing affirmations type");
    try {
      String jsonString =
          await rootBundle.loadString('assets/dummy/affirmations_type.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<ItemType> categories =
          jsonData.map((e) => ItemType.fromJson(e)).toList();
      final batch = FirebaseFirestore.instance.batch();
      for (var element in categories) {
        batch.set(affirmationsTypeDocument(element.id), element);
      }
      await batch.commit();
      debugPrint("******finish affirmation type");
    } catch (e) {
      debugPrint("Affiration Type Document Error: $e");
    }
  }

  ///Import Affirmations Music
  Future<void> importAffirmationMusicJson() async {
    log("******Writing affirmations music");
    try {
      String jsonString =
          await rootBundle.loadString('assets/dummy/affirmations_music.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<Music> categories = jsonData.map((e) => Music.fromJson(e)).toList();
      final batch = FirebaseFirestore.instance.batch();
      for (var element in categories) {
        batch.set(musicDocument(element.id), element);
      }
      await batch.commit();
      log("******finish affirmation music");
    } catch (e) {
      log("Affiration Music Document Error: $e");
    }
  }
}
