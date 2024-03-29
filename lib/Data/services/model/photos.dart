// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<Photos> photosFromJson(String str) =>
    List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
  Photos({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    // this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    // this.user,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  // Urls? urls;
  PhotoLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  Sponsorship? sponsorship;
  // User? user;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"] == null ? null : json["description"],
        altDescription:
            json["alt_description"] == null ? null : json["alt_description"],
        // urls: Urls.fromJson(json["urls"]),
        links: PhotoLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"] == null
            ? null
            : Sponsorship.fromJson(json["sponsorship"]),
        // user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "promoted_at":
            promotedAt == null ? null : promotedAt!.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description == null ? null : description,
        "alt_description": altDescription == null ? null : altDescription,
        // "urls": urls!.toJson(),
        "links": links!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship == null ? null : sponsorship!.toJson(),
        // "user": user!.toJson(),
      };
}

class PhotoLinks {
  PhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  factory PhotoLinks.fromJson(Map<String, dynamic> json) => PhotoLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Sponsorship {
  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    // this.sponsor,
  });

  List<String>? impressionUrls;
  String? tagline;
  String? taglineUrl;
  // User? sponsor;

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls:
            List<String>.from(json["impression_urls"].map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        // sponsor: User.fromJson(json["sponsor"]),
      );

  Map<String, dynamic> toJson() => {
        "impression_urls": List<dynamic>.from(impressionUrls!.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        // "sponsor": sponsor!.toJson(),
      };
}

// class User {
//   User({
//     this.id,
//     this.updatedAt,
//     this.username,
//     this.name,
//     this.firstName,
//     this.lastName,
//     this.twitterUsername,
//     this.portfolioUrl,
//     this.bio,
//     this.location,
//     this.profileImage,
//     this.instagramUsername,
//     this.totalCollections,
//     this.totalLikes,
//     this.totalPhotos,
//     this.acceptedTos,
//     this.forHire,
//   });

//   String? id;
//   DateTime? updatedAt;
//   String? username;
//   String? name;
//   String? firstName;
//   String? lastName;
//   String? twitterUsername;
//   String? portfolioUrl;
//   String? bio;
//   String? location;
//   ProfileImage? profileImage;
//   String? instagramUsername;
//   int? totalCollections;
//   int? totalLikes;
//   int? totalPhotos;
//   bool? acceptedTos;
//   bool? forHire;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         username: json["username"],
//         name: json["name"],
//         firstName: json["first_name"],
//         lastName: json["last_name"] == null ? '' : json["last_name"],
//         twitterUsername:
//             json["twitter_username"] == null ? null : json["twitter_username"],
//         portfolioUrl:
//             json["portfolio_url"] == null ? null : json["portfolio_url"],
//         bio: json["bio"] == null ? null : json["bio"],
//         location: json["location"] == null ? null : json["location"],
//         profileImage: ProfileImage.fromJson(json["profile_image"]),
//         instagramUsername: json["instagram_username"] == null
//             ? null
//             : json["instagram_username"],
//         totalCollections: json["total_collections"],
//         totalLikes: json["total_likes"],
//         totalPhotos: json["total_photos"],
//         acceptedTos: json["accepted_tos"],
//         forHire: json["for_hire"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "updated_at": updatedAt!.toIso8601String(),
//         "username": username,
//         "name": name,
//         "first_name": firstName,
//         "last_name": lastName == null ? null : lastName,
//         "twitter_username": twitterUsername == null ? null : twitterUsername,
//         "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
//         "bio": bio == null ? null : bio,
//         "location": location == null ? null : location,
//         "profile_image": profileImage!.toJson(),
//         "instagram_username":
//             instagramUsername == null ? null : instagramUsername,
//         "total_collections": totalCollections,
//         "total_likes": totalLikes,
//         "total_photos": totalPhotos,
//         "accepted_tos": acceptedTos,
//         "for_hire": forHire,
//       };
// }

// class ProfileImage {
//   ProfileImage({
//     this.small,
//     this.medium,
//     this.large,
//   });

//   String? small;
//   String? medium;
//   String? large;

//   factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
//         small: json["small"],
//         medium: json["medium"],
//         large: json["large"],
//       );

//   Map<String, dynamic> toJson() => {
//         "small": small,
//         "medium": medium,
//         "large": large,
//       };
// }

// class Urls {
//   Urls({
//     this.raw,
//     this.full,
//     this.regular,
//     this.small,
//     this.thumb,
//   });

//   String? raw;
//   String? full;
//   String? regular;
//   String? small;
//   String? thumb;

//   factory Urls.fromJson(Map<String, dynamic> json) => Urls(
//         raw: json["raw"],
//         full: json["full"],
//         regular: json["regular"],
//         small: json["small"],
//         thumb: json["thumb"],
//       );

//   Map<String, dynamic> toJson() => {
//         "raw": raw,
//         "full": full,
//         "regular": regular,
//         "small": small,
//         "thumb": thumb,
//       };
// }
