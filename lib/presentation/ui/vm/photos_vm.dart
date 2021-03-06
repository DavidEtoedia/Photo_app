import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/controller/generic_state_notifier.dart';
import 'package:photo_app/Data/repository/photo_repository.dart';
import 'package:photo_app/Data/repository/providers/service_providers.dart';
import 'package:photo_app/Data/services/model/photos.dart';

final getPhotoProvider =
    StateNotifierProvider.autoDispose<PhotoVM, RequestState<List<Photos>>>(
        (ref) => PhotoVM(ref));

class PhotoVM extends RequestStateNotifier<List<Photos>> {
  final PhotoRepository _photoRepository;

  PhotoVM(Ref ref) : _photoRepository = ref.read(photoProvider) {
    getPhoto();
  }

  void getPhoto([int currentPage = 1]) =>
      makeRequest(() => _photoRepository.getPhoto(currentPage));
}
