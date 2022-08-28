import 'package:freezed_annotation/freezed_annotation.dart';

import '../profile_image/profile_image.dart';
part 'photo_user.freezed.dart';
part 'photo_user.g.dart';

@freezed
class PhotoUser with _$PhotoUser {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PhotoUser({
    String? id,
    DateTime? updatedAt,
    String? username,
    String? name,
    String? firstName,
    String? lastName,
    String? twitterUsername,
    String? portfolioUrl,
    String? bio,
    String? location,
    ProfileImage? profileImage,
    String? instagramUsername,
    int? totalCollections,
    int? totalLikes,
    int? totalPhotos,
    bool? acceptedTos,
    bool? forHire,
  }) = _PhotoUser;

  factory PhotoUser.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserFromJson(json);
}
