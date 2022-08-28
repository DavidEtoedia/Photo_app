import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/constant/constant.dart';
import 'package:photo_app/Data/services/model/failure.dart';
import 'package:photo_app/Data/services/model/photos.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'model/freezed model/photo_class/photo_class.dart';
import 'model/freezed model/photo_model.dart';
import 'model/photo_by_id.dart';
import 'model/photo_by_tag.dart';

class PhotoServices {
  final Dio _dio;
  PhotoServices(
    this._dio,
  ) {
    _dio.interceptors.add(
      PrettyDioLogger(),
    );
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before the first retry
          Duration(seconds: 2), // wait 2 sec before the second retry
          Duration(seconds: 3), // wait 3 sec before the third retry
          // Duration(seconds: 4), // wait 4 sec before the fourth retry
        ],
        // retryableExtraStatuses: {status401Unauthorized},
      ),
    );
  }

  Future<List<Photo>> getPhoto([int pages = 1]) async {
    final url = "photos?page=$pages&client_id=${Constants.apiKey}";

    try {
      final response = await _dio.get(url);
      final res = List<Photo>.from(response.data.map((x) => Photo.fromJson(x)));

      print(res[2].user!.firstName);

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
    final url = "/photos/$photoId?client_id=${Constants.apiKey}";
    try {
      final options = Options()..disableRetry = false;
      // final request =
      //     RequestOptions(path: url, baseUrl: "https://api.unsplash.com")
      //       ..disableRetry = false;
      final response = await _dio.get(url, options: options);

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
