import 'package:cloud_firestore/cloud_firestore.dart';

import '../../affirmations/models/music.dart';
import '../../model/category.dart';
import '../../model/therapy_video.dart';
import '../../model/type.dart';
import '../../model/vlog_video.dart';
import 'reference.dart';

Query<Category> homeCategoryQuery =
    categoryCollection().where('page', isEqualTo: "Home");
Query<Category> affirmationsCategoryQuery =
    categoryCollection().where('page', isEqualTo: "Affirmations");
Query<ItemType> homeTypeQuery =
    homeTypeCollection().orderBy('order', descending: true);
Query<ItemType> affirmationsTypeQuery =
    affirmationsTypeCollection().orderBy('order', descending: true);
Query<Music> musicQuery = musicCollection();
Query<VlogVideo> vlogVideoQuery =
    vlogVideoCollection().orderBy("order", descending: true);
Query<Category> therapyCategoryQuery =
    therapyCategoryCollection().orderBy("order", descending: true);
Query<TherapyVideo> therapyVideoQuery =
    therapyVideoCollection().orderBy("order", descending: true);
