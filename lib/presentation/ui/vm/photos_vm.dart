import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/controller/generic_state_notifier.dart';
import 'package:photo_app/Data/repository/photo_repository.dart';
import 'package:photo_app/Data/repository/providers/service_providers.dart';

import '../../../Data/services/model/freezed model/photo_class/photo_class.dart';

final getPhotoProvider =
    StateNotifierProvider.autoDispose<PhotoVM, RequestState<List<Photo>>>(
        (ref) => PhotoVM(ref));

class PhotoVM extends RequestStateNotifier<List<Photo>> {
  final PhotoRepository _photoRepository;

  PhotoVM(Ref ref) : _photoRepository = ref.read(photoProvider) {
    getPhoto();
  }

  void getPhoto([int currentPage = 1]) =>
      makeRequest(() => _photoRepository.getPhoto(currentPage));
}
