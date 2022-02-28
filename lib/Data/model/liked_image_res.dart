import 'dart:convert';

// class LikedImageRes {
//   String? id;
//   String? url;
//   DateTime? created;

//   LikedImageRes({
//     this.id,
//     this.url,
//     this.created,
//   });

//   factory LikedImageRes.fromJson(Map<String, dynamic> json) => LikedImageRes(
//         // created: DateTime.parse(json["created"]),
//         id: json['id'],
//         url: json['url'],
//         created: DateTime.parse(json["created"]),
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'url': url,
//         'created': created!.toIso8601String(),
//       };
// }

// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

List<Likes> likesFromJson(String str) =>
    List<Likes>.from(json.decode(str).map((x) => Likes.fromJson(x)));

String likesToJson(List<Likes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Likes {
  Likes({
    this.id,
    this.created,
    this.url,
  });

  String? id;
  DateTime? created;
  List<dynamic>? url;

  factory Likes.fromJson(Map<String, dynamic> json) => Likes(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        url: List<dynamic>.from(json["url"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created!.toIso8601String(),
        "url": List<dynamic>.from(url!.map((x) => x)),
      };
}
