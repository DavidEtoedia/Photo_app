class LikedImages {
  String id;
  List image;
  DateTime created;

  LikedImages({
    required this.id,
    required this.image,
    required this.created,
  });

  factory LikedImages.fromJson(Map<String, dynamic> json) => LikedImages(
        // created: DateTime.parse(json["created"]),
        id: json['id'],
        image: ['image'].toList(),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'created': created.toIso8601String(),
      };
}

class UserImage {
  UserImage({
    // required this.title,
    required this.imageUrl,
    // required this.dateCreated,
  });

  // final String title;
  final String imageUrl;

  // final DateTime dateCreated;

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
        // title: json["title"],
        imageUrl: json["imageUrl"],
        // dateCreated: json["dateCreated"]
      );

  Map<String, dynamic> toJson() => {
        // "title": title,
        "imageUrl": imageUrl,
        // "dateCreated": dateCreated,
      };
}
