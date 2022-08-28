import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_url.freezed.dart';
part 'image_url.g.dart';

@freezed
class Url with _$Url {
  const factory Url({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
  }) = _Url;

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
}
