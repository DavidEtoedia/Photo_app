// To parse this JSON data, do
//
//     final photoByTag = photoByTagFromJson(jsonString);

import 'dart:convert';

PhotoByTag photoByTagFromJson(String str) =>
    PhotoByTag.fromJson(json.decode(str));

String photoByTagToJson(PhotoByTag data) => json.encode(data.toJson());

class PhotoByTag {
  PhotoByTag({
    this.total,
    this.totalPages,
    this.results,
  });

  int? total;
  int? totalPages;
  List<Result>? results;

  factory PhotoByTag.fromJson(Map<String, dynamic> json) => PhotoByTag(
        total: json["total"],
        totalPages: json["total_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.urls,
    required this.user,
    // this.tags,
  });

  String? id;
  Urls? urls;
  User user;
  // List<Tag>? tags;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? '',

        urls: Urls.fromJson(json["urls"] ?? ''),

        user: User.fromJson(json["user"] ?? ''),
        // tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,

        if (urls != null) "urls": urls!.toJson(),

        if (urls != null) "user": user.toJson(),
        // "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    this.name,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });

  String id;
  String? name;
  String firstName;
  String lastName;
  ProfileImage profileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        profileImage: ProfileImage.fromJson(json["profile_image"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        if (name != null) "name": name,
        "first_name": firstName,
        "profile_image": profileImage.toJson(),
      };
}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  String? small;
  String? medium;
  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"] ?? '',
        medium: json["medium"] ?? '',
        large: json["large"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        if (small != null) "small": small,
        if (medium != null) "medium": medium,
        if (large != null) "large": large,
      };
}

// class Tag {
//   Tag({
//     this.type,
//     this.title,
//     this.source,
//   });

//   Type? type;
//   String? title;
//   Source? source;

//   factory Tag.fromJson(Map<String, dynamic> json) => Tag(
//         title: json["title"],
//         source: json["source"] == null ? null : Source.fromJson(json["source"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "source": source == null ? null : source!.toJson(),
//       };
// }

// class Source {
//   Source({
//     this.ancestry,
//     this.title,
//     this.subtitle,
//     this.description,
//     this.metaTitle,
//     this.metaDescription,
//     this.coverPhoto,
//   });

//   Ancestry? ancestry;
//   String? title;
//   String? subtitle;
//   String? description;
//   String? metaTitle;
//   String? metaDescription;
//   CoverPhoto? coverPhoto;

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         ancestry: Ancestry.fromJson(json["ancestry"]),
//         title: json["title"],
//         subtitle: json["subtitle"],
//         description: json["description"],
//         metaTitle: json["meta_title"],
//         metaDescription: json["meta_description"],
//         coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "ancestry": ancestry!.toJson(),
//         "title": title,
//         "subtitle": subtitle,
//         "description": description,
//         "meta_title": metaTitle,
//         "meta_description": metaDescription,
//         "cover_photo": coverPhoto!.toJson(),
//       };
// }

// class Ancestry {
//   Ancestry({
//     this.type,
//     this.category,
//     this.subcategory,
//   });

//   Category? type;
//   Category? category;
//   Category? subcategory;

//   factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
//         type: Category.fromJson(json["type"]),
//         category: Category.fromJson(json["category"]),
//         subcategory: json["subcategory"] == null
//             ? null
//             : Category.fromJson(json["subcategory"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type!.toJson(),
//         "category": category!.toJson(),
//         "subcategory": subcategory == null ? null : subcategory!.toJson(),
//       };
// }

// class Category {
//   Category({
//     this.slug,
//     this.prettySlug,
//   });

//   String? slug;
//   String? prettySlug;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         slug: json["slug"],
//         prettySlug: json["pretty_slug"],
//       );

//   Map<String, dynamic> toJson() => {
//         "slug": slug,
//         "pretty_slug": prettySlug,
//       };
// // }

// class CoverPhoto {
//   CoverPhoto({
//     this.id,
//     this.width,
//     this.height,
//     this.color,
//     this.blurHash,
//     this.description,
//     this.altDescription,
//     this.urls,
//     this.categories,
//     this.likes,
//     this.currentUserCollections,
//     this.user,
//   });

//   String? id;
//   int? width;
//   int? height;
//   String? color;
//   String? blurHash;
//   String? description;
//   String? altDescription;
//   Urls? urls;
//   List<dynamic>? categories;
//   int? likes;
//   List<dynamic>? currentUserCollections;
//   User? user;

//   factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
//         id: json["id"],
//         width: json["width"],
//         height: json["height"],
//         color: json["color"],
//         blurHash: json["blur_hash"],
//         description: json["description"],
//         altDescription: json["alt_description"],
//         urls: Urls.fromJson(json["urls"]),
//         categories: List<dynamic>.from(json["categories"].map((x) => x)),
//         likes: json["likes"],
//         currentUserCollections:
//             List<dynamic>.from(json["current_user_collections"].map((x) => x)),
//         user: User.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "width": width,
//         "height": height,
//         "color": color,
//         "blur_hash": blurHash,
//         "description": description,
//         "alt_description": altDescription,
//         "urls": urls!.toJson(),
//         "categories": List<dynamic>.from(categories!.map((x) => x)),
//         "likes": likes,
//         "current_user_collections":
//             List<dynamic>.from(currentUserCollections!.map((x) => x)),
//         "user": user!.toJson(),
//       };
// }

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}

enum Type { SEARCH, LANDING_PAGE }
