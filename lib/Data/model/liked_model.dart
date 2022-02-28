class LikedImages {
  String? id;
  List? url;
  DateTime? created;

  LikedImages({
    this.id,
    this.url,
    this.created,
  });

  factory LikedImages.fromJson(Map<String, dynamic> json) => LikedImages(
        // created: DateTime.parse(json["created"]),
        id: json['id'],
        url: ['url'].toList(),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'created': created!.toIso8601String(),
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
