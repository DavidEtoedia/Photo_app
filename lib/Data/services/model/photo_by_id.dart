// To parse this JSON data, do
//
//     final photosById = photosByIdFromJson(jsonString);

import 'dart:convert';

PhotosById photosByIdFromJson(String str) =>
    PhotosById.fromJson(json.decode(str));

String photosByIdToJson(PhotosById data) => json.encode(data.toJson());

class PhotosById {
  PhotosById({
    this.id,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.user,
    this.exif,
    this.location,
    this.meta,
    this.tags,
    this.tagsPreview,
    this.relatedCollections,
    this.views,
    this.downloads,
  });

  String? id;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  PhotosByIdLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  User? user;
  Exif? exif;
  Location? location;
  Meta? meta;
  bool? publicDomain;
  List<PhotosByIdTag>? tags;
  List<TagsPreview>? tagsPreview;
  RelatedCollections? relatedCollections;
  int? views;
  int? downloads;

  factory PhotosById.fromJson(Map<String, dynamic> json) => PhotosById(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"] == null ? '' : json["description"],
        altDescription:
            json["alt_description"] == null ? '' : json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: PhotosByIdLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        user: User.fromJson(json["user"]),
        exif: Exif.fromJson(json["exif"] == null ? 'unknown' : json["exif"]),
        location: Location.fromJson(
            json["location"] == null ? 'unknown' : json["location"]),
        meta: Meta.fromJson(json["meta"]),
        tags: List<PhotosByIdTag>.from(
            json["tags"].map((x) => PhotosByIdTag.fromJson(x))),
        tagsPreview: List<TagsPreview>.from(
            json["tags_preview"].map((x) => TagsPreview.fromJson(x))),
        relatedCollections:
            RelatedCollections.fromJson(json["related_collections"]),
        views: json["views"],
        downloads: json["downloads"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description == null ? '' : description,
        "alt_description": altDescription == null ? "" : altDescription,
        "urls": urls!.toJson(),
        "links": links!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "user": user!.toJson(),
        "exif": exif!.toJson() == null ? 'unknown' : exif!.toJson(),
        "location": location!.toJson() == null ? 'unknown' : location!.toJson(),
        "meta": meta!.toJson(),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "tags_preview": List<dynamic>.from(tagsPreview!.map((x) => x.toJson())),
        "related_collections": relatedCollections!.toJson(),
        "views": views,
        "downloads": downloads,
      };
}

class Exif {
  Exif({
    this.make,
    this.model,
    this.name,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  String? make;
  String? model;
  String? name;
  String? exposureTime;
  String? aperture;
  String? focalLength;
  int? iso;

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        make: json["make"],
        model: json["model"],
        name: json["name"],
        exposureTime: json["exposure_time"],
        aperture: json["aperture"],
        focalLength: json["focal_length"],
        iso: json["iso"],
      );

  Map<String, dynamic> toJson() => {
        "make": make,
        "model": model,
        "name": name,
        "exposure_time": exposureTime,
        "aperture": aperture,
        "focal_length": focalLength,
        "iso": iso,
      };
}

class PhotosByIdLinks {
  PhotosByIdLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  factory PhotosByIdLinks.fromJson(Map<String, dynamic> json) =>
      PhotosByIdLinks(
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

class Location {
  Location({
    this.title,
    this.name,
    this.city,
    this.country,
    this.position,
  });

  String? title;
  String? name;
  String? city;
  String? country;
  Position? position;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json["title"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        position: Position.fromJson(json["position"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "name": name,
        "city": city,
        "country": country,
        "position": position!.toJson(),
      };
}

class Position {
  Position({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory Position.fromJson(Map<String, dynamic> json) =>
      Position(latitude: json["latitude"], longitude: json["longitude"]);

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Meta {
  Meta({
    this.index,
  });

  bool? index;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
      };
}

class RelatedCollections {
  RelatedCollections({
    this.total,
    this.type,
    this.results,
  });

  int? total;
  String? type;
  List<Result>? results;

  factory RelatedCollections.fromJson(Map<String, dynamic> json) =>
      RelatedCollections(
        total: json["total"],
        type: json["type"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "type": type,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.title,
    this.curated,
    this.featured,
    this.totalPhotos,
    this.private,
    this.shareKey,
    this.tags,
    this.links,
    this.user,
    this.coverPhoto,
    this.previewPhotos,
  });

  String? id;
  String? title;
  bool? curated;
  bool? featured;
  int? totalPhotos;
  bool? private;
  String? shareKey;
  List<ResultTag>? tags;
  ResultLinks? links;
  User? user;
  ResultCoverPhoto? coverPhoto;
  List<PreviewPhoto>? previewPhotos;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        curated: json["curated"],
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"],
        tags: List<ResultTag>.from(
            json["tags"].map((x) => ResultTag.fromJson(x))),
        links: ResultLinks.fromJson(json["links"]),
        user: User.fromJson(json["user"]),
        coverPhoto: ResultCoverPhoto.fromJson(json["cover_photo"]),
        previewPhotos: List<PreviewPhoto>.from(
            json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "curated": curated,
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey,
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "user": user!.toJson(),
        "cover_photo": coverPhoto!.toJson(),
        "preview_photos":
            List<dynamic>.from(previewPhotos!.map((x) => x.toJson())),
      };
}

class ResultCoverPhoto {
  ResultCoverPhoto({
    this.id,
    this.width,
    this.height,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.user,
  });

  String? id;
  int? width;
  int? height;
  String? description;
  String? altDescription;
  Urls? urls;
  PhotosByIdLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  User? user;

  factory ResultCoverPhoto.fromJson(Map<String, dynamic> json) =>
      ResultCoverPhoto(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        description: json["description"] == null ? null : json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: PhotosByIdLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "description": description == null ? null : description,
        "alt_description": altDescription,
        "urls": urls!.toJson(),
        "links": links!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "user": user!.toJson(),
      };
}

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

class User {
  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.location,
    this.profileImage,
    this.totalCollections,
    this.totalLikes,
    this.forHire,
  });

  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? location;
  ProfileImage? profileImage;
  int? totalCollections;
  int? totalLikes;
  bool? forHire;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        location: json["location"] == null ? null : json["location"],
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        forHire: json["for_hire"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName == null ? null : lastName,
        "location": location == null ? null : location,
        "profile_image": profileImage!.toJson(),
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "for_hire": forHire,
      };
}

class UserLinks {
  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
  });

  String? self;
  String? html;
  String? photos;
  String? likes;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
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
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class ResultLinks {
  ResultLinks({
    this.self,
    this.html,
    this.photos,
    this.related,
  });

  String? self;
  String? html;
  String? photos;
  String? related;

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
      };
}

class PreviewPhoto {
  PreviewPhoto({
    this.id,
    this.urls,
  });

  String? id;

  Urls? urls;

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
        id: json["id"],
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urls": urls!.toJson(),
      };
}

class ResultTag {
  ResultTag({
    this.type,
    this.title,
    this.source,
  });

  TypeEnum? type;
  String? title;
  PurpleSource? source;

  factory ResultTag.fromJson(Map<String, dynamic> json) => ResultTag(
        type: typeEnumValues.map[json["type"]],
        title: json["title"],
        source: json["source"] == null
            ? null
            : PurpleSource.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
        "source": source == null ? null : source!.toJson(),
      };
}

class PurpleSource {
  PurpleSource({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  Ancestry? ancestry;
  String? title;
  String? subtitle;
  String? description;
  String? metaTitle;
  String? metaDescription;
  PurpleCoverPhoto? coverPhoto;

  factory PurpleSource.fromJson(Map<String, dynamic> json) => PurpleSource(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: PurpleCoverPhoto.fromJson(json["cover_photo"]),
      );

  Map<String, dynamic> toJson() => {
        "ancestry": ancestry!.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto!.toJson(),
      };
}

class Ancestry {
  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  TypeClass? type;
  TypeClass? category;
  TypeClass? subcategory;

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: TypeClass.fromJson(json["type"]),
        category: json["category"] == null
            ? null
            : TypeClass.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : TypeClass.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type!.toJson(),
        "category": category == null ? null : category!.toJson(),
        "subcategory": subcategory == null ? null : subcategory!.toJson(),
      };
}

class TypeClass {
  TypeClass({
    this.slug,
    this.prettySlug,
  });

  String? slug;
  String? prettySlug;

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class PurpleCoverPhoto {
  PurpleCoverPhoto({
    this.id,
    this.width,
    this.height,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.user,
  });

  String? id;

  int? width;
  int? height;
  Urls? urls;
  PhotosByIdLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;

  User? user;

  factory PurpleCoverPhoto.fromJson(Map<String, dynamic> json) =>
      PurpleCoverPhoto(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        urls: Urls.fromJson(json["urls"]),
        links: PhotosByIdLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "urls": urls!.toJson(),
        "links": links!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "user": user!.toJson(),
      };
}

enum TypeEnum { SEARCH, LANDING_PAGE }

final typeEnumValues = EnumValues(
    {"landing_page": TypeEnum.LANDING_PAGE, "search": TypeEnum.SEARCH});

class PhotosByIdTag {
  PhotosByIdTag({
    this.type,
    this.title,
    this.source,
  });

  TypeEnum? type;
  String? title;
  FluffySource? source;

  factory PhotosByIdTag.fromJson(Map<String, dynamic> json) => PhotosByIdTag(
        type: typeEnumValues.map[json["type"]],
        title: json["title"],
        source: json["source"] == null
            ? null
            : FluffySource.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
        "source": source == null ? '' : source!.toJson(),
      };
}

class FluffySource {
  FluffySource({
    // this.ancestry,
    // this.title,
    // this.subtitle,
    required this.description,
    // this.metaTitle,
    // this.metaDescription,
    // this.coverPhoto,
  });

  // Ancestry? ancestry;
  // String? title;
  // String? subtitle;
  String description;
  // String? metaTitle;
  // String? metaDescription;
  // FluffyCoverPhoto? coverPhoto;

  factory FluffySource.fromJson(Map<String, dynamic> json) => FluffySource(
        // ancestry: Ancestry.fromJson(json["ancestry"]),
        // title: json["title"],
        // subtitle: json["subtitle"],
        description: json["description"] == null ? '' : json["description"],
        // metaTitle: json["meta_title"],
        // metaDescription: json["meta_description"],
        // coverPhoto: FluffyCoverPhoto.fromJson(json["cover_photo"]),
      );

  Map<String, dynamic> toJson() => {
        // "ancestry": ancestry!.toJson(),
        // "title": title,
        // "subtitle": subtitle,
        "description": description == null ? '' : description,
        // "meta_title": metaTitle,
        // "meta_description": metaDescription,
        // "cover_photo": coverPhoto!.toJson(),
      };
}

class FluffyCoverPhoto {
  FluffyCoverPhoto({
    this.id,
    this.width,
    this.height,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.user,
  });

  String? id;
  int? width;
  int? height;
  String? description;
  String? altDescription;
  Urls? urls;
  PhotosByIdLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;

  User? user;

  factory FluffyCoverPhoto.fromJson(Map<String, dynamic> json) =>
      FluffyCoverPhoto(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        description: json["description"] == null ? null : json["description"],
        altDescription:
            json["alt_description"] == null ? null : json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: PhotosByIdLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "description": description == null ? null : description,
        "alt_description": altDescription == null ? null : altDescription,
        "urls": urls!.toJson(),
        "links": links!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "user": user!.toJson(),
      };
}

class TagsPreview {
  TagsPreview({
    this.type,
    this.title,
  });

  TypeEnum? type;
  String? title;

  factory TagsPreview.fromJson(Map<String, dynamic> json) => TagsPreview(
        type: typeEnumValues.map[json["type"]],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
