import 'package:freezed_annotation/freezed_annotation.dart';

import 'photo_class/photo_class.dart';
part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

@freezed
class PhotoList with _$PhotoList {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PhotoList({List<Photo>? photos}) = _PhotoList;

  factory PhotoList.fromJson(Map<String, dynamic> json) =>
      _$PhotoListFromJson(json);
  // Map<String, dynamic> toJson() => _$PhotoListToJson(this);
}
