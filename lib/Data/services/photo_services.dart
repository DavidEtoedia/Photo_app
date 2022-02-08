import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/constant/constant.dart';
import 'package:photo_app/Data/services/model/failure.dart';
import 'package:photo_app/Data/services/model/photos.dart';
import 'package:photo_app/presentation/locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'model/photo_by_id.dart';
import 'model/photo_by_tag.dart';

class PhotoServices {
  final Dio _dio;
  PhotoServices(
    this._dio,
  ) {
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<List<Photos>> getPhoto([int pages = 1]) async {
    final url = "photos?page=$pages&client_id=${Constants.apiKey}";

    try {
      final response = await _dio.get(url);
      final res =
          List<Photos>.from(response.data.map((x) => Photos.fromJson(x)));

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!;
      } else {
        throw e.error;
      }
    }
  }

  Future<PhotosById> photoById(String photoId) async {
    final url = "photos/$photoId?client_id=${Constants.apiKey}";
    try {
      final response = await _dio.get(url);
      final res = PhotosById.fromJson(response.data);

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!;
      } else {
        throw e.error;
      }
    }
  }

  Future<PhotoByTag> photoByTag(String tag) async {
    final url =
        "/search/photos?page=1&query=$tag&client_id=${Constants.apiKey}";
    try {
      final response = await _dio.get(url);
      final res = PhotoByTag.fromJson(response.data);

      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!;
      } else {
        throw e.error;
      }
    }
  }
}
