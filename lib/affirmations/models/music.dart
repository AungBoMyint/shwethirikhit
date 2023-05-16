class Music {
  final String id;
  final String name;
  final String image;
  final String desc;
  final String audioURL;
  final String type;
  const Music({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
    required this.audioURL,
    required this.type,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'desc': desc,
        'audioURL': audioURL,
        'type': type,
      };
  factory Music.fromJson(Map<String, dynamic> json) => Music(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        desc: json["desc"],
        audioURL: json["audioURL"],
        type: json["type"],
      );
}
