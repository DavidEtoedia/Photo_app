import 'package:photo_app/Data/services/model/photos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../url/image_url.dart';
import '../user_model/photo_user.dart';
part 'photo_class.freezed.dart';
part 'photo_class.g.dart';

@freezed
class Photo with _$Photo {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Photo(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? promotedAt,
      int? width,
      int? height,
      String? color,
      String? blurHash,
      String? description,
      String? altDescription,
      Url? urls,
      PhotoLinks? links,
      List<dynamic>? categories,
      int? likes,
      bool? likedByUser,
      PhotoUser? user}) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
