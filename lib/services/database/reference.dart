import 'package:cloud_firestore/cloud_firestore.dart';
import '../../affirmations/models/music.dart';
import '../../consultant_appointant/model/expert.dart';
import '../../model/category.dart';
import '../../model/type.dart';
import '../../model/vlog_video.dart';

CollectionReference<Category> categoryCollection() =>
    FirebaseFirestore.instance.collection("category").withConverter<Category>(
        fromFirestore: (snap, __) => Category.fromJson(snap.data()!),
        toFirestore: (cat, snap) => cat.toJson());
DocumentReference<Category> categoryDocument(String id) =>
    categoryCollection().doc(id);

CollectionReference<Music> musicCollection() =>
    FirebaseFirestore.instance.collection("music").withConverter<Music>(
        fromFirestore: (snap, __) => Music.fromJson(snap.data()!),
        toFirestore: (music, snap) => music.toJson());
DocumentReference<Music> musicDocument(String id) => musicCollection().doc(id);
CollectionReference<ItemType> affirmationsTypeCollection() =>
    FirebaseFirestore.instance
        .collection("affirmations_type")
        .withConverter<ItemType>(
            fromFirestore: (snap, __) => ItemType.fromJson(snap.data()!),
            toFirestore: (itemType, snap) => itemType.toJson());
DocumentReference<ItemType> affirmationsTypeDocument(String id) =>
    affirmationsTypeCollection().doc(id);
CollectionReference<ItemType> homeTypeCollection() =>
    FirebaseFirestore.instance.collection("home_type").withConverter<ItemType>(
        fromFirestore: (snap, __) => ItemType.fromJson(snap.data()!),
        toFirestore: (itemType, snap) => itemType.toJson());
DocumentReference<ItemType> homeTypeDocument(String id) =>
    homeTypeCollection().doc(id);
CollectionReference<ExpertModel> expertsCollection() =>
    FirebaseFirestore.instance.collection("experts").withConverter<ExpertModel>(
        fromFirestore: (snap, __) =>
            ExpertModel.fromJson(snap.data()!, snap.id),
        toFirestore: (itemType, snap) => itemType.toJson());
DocumentReference<ExpertModel> expertsDocument(String id) =>
    expertsCollection().doc(id);

CollectionReference<VlogVideo> vlogVideoCollection() => FirebaseFirestore
    .instance
    .collection("vlog_videos")
    .withConverter<VlogVideo>(
        fromFirestore: (snapshot, __) => VlogVideo.fromJson(snapshot.data()!),
        toFirestore: (vlog, __) => vlog.toJson());

DocumentReference<VlogVideo> vlogVideoDocument(String id) =>
    vlogVideoCollection().doc(id);
