// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoList _$PhotoListFromJson(Map<String, dynamic> json) {
  return _PhotoList.fromJson(json);
}

/// @nodoc
class _$PhotoListTearOff {
  const _$PhotoListTearOff();

  _PhotoList call({List<Photo>? photos}) {
    return _PhotoList(
      photos: photos,
    );
  }

  PhotoList fromJson(Map<String, Object?> json) {
    return PhotoList.fromJson(json);
  }
}

/// @nodoc
const $PhotoList = _$PhotoListTearOff();

/// @nodoc
mixin _$PhotoList {
  List<Photo>? get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoListCopyWith<PhotoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoListCopyWith<$Res> {
  factory $PhotoListCopyWith(PhotoList value, $Res Function(PhotoList) then) =
      _$PhotoListCopyWithImpl<$Res>;
  $Res call({List<Photo>? photos});
}

/// @nodoc
class _$PhotoListCopyWithImpl<$Res> implements $PhotoListCopyWith<$Res> {
  _$PhotoListCopyWithImpl(this._value, this._then);

  final PhotoList _value;
  // ignore: unused_field
  final $Res Function(PhotoList) _then;

  @override
  $Res call({
    Object? photos = freezed,
  }) {
    return _then(_value.copyWith(
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
    ));
  }
}

/// @nodoc
abstract class _$PhotoListCopyWith<$Res> implements $PhotoListCopyWith<$Res> {
  factory _$PhotoListCopyWith(
          _PhotoList value, $Res Function(_PhotoList) then) =
      __$PhotoListCopyWithImpl<$Res>;
  @override
  $Res call({List<Photo>? photos});
}

/// @nodoc
class __$PhotoListCopyWithImpl<$Res> extends _$PhotoListCopyWithImpl<$Res>
    implements _$PhotoListCopyWith<$Res> {
  __$PhotoListCopyWithImpl(_PhotoList _value, $Res Function(_PhotoList) _then)
      : super(_value, (v) => _then(v as _PhotoList));

  @override
  _PhotoList get _value => super._value as _PhotoList;

  @override
  $Res call({
    Object? photos = freezed,
  }) {
    return _then(_PhotoList(
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PhotoList implements _PhotoList {
  const _$_PhotoList({this.photos});

  factory _$_PhotoList.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoListFromJson(json);

  @override
  final List<Photo>? photos;

  @override
  String toString() {
    return 'PhotoList(photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoList &&
            const DeepCollectionEquality().equals(other.photos, photos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(photos));

  @JsonKey(ignore: true)
  @override
  _$PhotoListCopyWith<_PhotoList> get copyWith =>
      __$PhotoListCopyWithImpl<_PhotoList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoListToJson(this);
  }
}

abstract class _PhotoList implements PhotoList {
  const factory _PhotoList({List<Photo>? photos}) = _$_PhotoList;

  factory _PhotoList.fromJson(Map<String, dynamic> json) =
      _$_PhotoList.fromJson;

  @override
  List<Photo>? get photos;
  @override
  @JsonKey(ignore: true)
  _$PhotoListCopyWith<_PhotoList> get copyWith =>
      throw _privateConstructorUsedError;
}
