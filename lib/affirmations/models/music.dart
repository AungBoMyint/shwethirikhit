class Music {
  final String id;
  final String name;
  final String image;
  final String desc;
  final String audioURL;
  final String type;
  final String categoryID;
  final DateTime dateTime;
  const Music({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
    required this.audioURL,
    required this.type,
    required this.categoryID,
    required this.dateTime,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'desc': desc,
        'audioURL': audioURL,
        'type': type,
        'categoryID': categoryID,
        'dateTime': dateTime.toIso8601String(),
      };
  factory Music.fromJson(Map<String, dynamic> json) => Music(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        desc: json["desc"],
        audioURL: json["audioURL"],
        type: json["type"],
        categoryID: json["categoryID"],
        dateTime: DateTime.tryParse(json["dateTime"]) as DateTime,
      );
}
