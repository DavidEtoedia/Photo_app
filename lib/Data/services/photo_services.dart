import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/constant/constant.dart';
import 'package:photo_app/Data/services/model/failure.dart';
import 'package:photo_app/Data/services/photos.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final photoServiceProvider = Provider<PhotoServices>((ref) {
  return PhotoServices((ref.watch(dioProvider)));
});

final dioProvider = Provider((ref) => Dio(BaseOptions(
    receiveTimeout: 100000,
    connectTimeout: 100000,
    baseUrl: Constants.apiUrl)));

class PhotoServices {
  final Dio _dio;
  PhotoServices(
    this._dio,
  ) {
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<List<Photos>> getPhoto() async {
    const url = "photos/?client_id=${Constants.apiKey}";
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
}
