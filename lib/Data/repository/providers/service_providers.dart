import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/constant/constant.dart';
import 'package:photo_app/Data/repository/photo_repository.dart';
import 'package:photo_app/Data/services/photo_services.dart';

final dioProvider = Provider((ref) => Dio(BaseOptions(
    receiveTimeout: 100000,
    connectTimeout: 100000,
    baseUrl: Constants.apiUrl)));

final photoServiceProvider = Provider<PhotoServices>((ref) {
  return PhotoServices((ref.watch(dioProvider)));
});

final photoProvider = Provider<PhotoRepository>((ref) {
  final photoService = ref.watch(photoServiceProvider);
  return PhotoRepository(photoService);
});
