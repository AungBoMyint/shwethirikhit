import 'package:cloud_firestore/cloud_firestore.dart';

import '../../affirmations/models/music.dart';
import '../../consultant_appointant/model/expert.dart';
import '../../model/category.dart';
import '../../model/therapy_video.dart';
import '../../model/type.dart';
import '../../model/vlog_video.dart';
import 'reference.dart';

Query<ExpertModel> expertQuery(String typeID) =>
    expertsCollection().where("type", isEqualTo: typeID);
Query<Category> homeCategoryQuery =
    categoryCollection().orderBy('order', descending: true);
Query<Category> affirmationsCategoryQuery =
    affirmationsCategoryCollection().orderBy('order');
Query<ItemType> homeTypeQuery = homeTypeCollection().orderBy('order');
Query<ItemType> affirmationsTypeQuery =
    affirmationsTypeCollection().orderBy('order');

Query<Music> affirmationsTypeMusicsQuery(String typeID) =>
    musicCollection().where("type", isEqualTo: typeID).orderBy("dateTime");
Query<Music> affirmationsCategoryMusicsQuery(String categoryID) =>
    musicCollection()
        .where("categoryID", isEqualTo: categoryID)
        .orderBy("dateTime");

Query<VlogVideo> vlogVideoQuery = vlogVideoCollection().orderBy("dateTime");
Query<Category> therapyCategoryQuery =
    therapyCategoryCollection().orderBy("dateTime");
/* Query<TherapyVideo> therapyVideoQuery =
    therapyVideoCollection().orderBy("order", descending: true); */
Query<TherapyVideo> therapyVideosQuery(String categoryID) =>
    therapyVideoCollection()
        .where("parentID", isEqualTo: categoryID)
        .orderBy('dateTime');
