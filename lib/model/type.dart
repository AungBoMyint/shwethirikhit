class ItemType {
  final String id;
  final String name;
  final String dateTime;
  final int order;
  const ItemType({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.order,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dateTime': dateTime,
        'order': order,
      };
  factory ItemType.fromJson(Map<String, dynamic> json) => ItemType(
        id: json["id"],
        name: json["name"],
        dateTime: json["dateTime"],
        order: json["order"],
      );
}
