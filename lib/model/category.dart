class Category {
  final String id;
  final String name;
  final String image;
  final String page;
  final int? order;
  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.page,
    this.order,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "page": page,
        'order': order,
      };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as String,
        name: json["name"] as String,
        image: json["image"] as String,
        page: json["page"] as String,
        order: json["order"] as int?,
      );
}
