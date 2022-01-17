import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/photo_repository.dart';
import 'package:photo_app/Data/services/model/photo_by_id.dart';

final photoByIdProvider =
    FutureProvider.autoDispose.family<PhotosById, String>((ref, photoId) async {
  return ref.watch(photoProvider).photoById(photoId);
});
