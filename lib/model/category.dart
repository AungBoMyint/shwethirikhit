class Category {
  final String id;
  final String name;
  final String image;
  final int? order;
  final DateTime dateTime;
  const Category({
    required this.id,
    required this.name,
    required this.image,
    this.order,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        'order': order,
        'dateTime': dateTime.toIso8601String(),
      };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as String,
        name: json["name"] as String,
        image: json["image"] as String,
        order: json["order"] as int?,
        dateTime: DateTime.tryParse(json["dateTime"]) as DateTime,
      );
}
