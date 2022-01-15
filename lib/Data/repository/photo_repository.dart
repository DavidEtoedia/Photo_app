import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/i_repo.dart';
import 'package:photo_app/Data/services/photo_services.dart';
import 'package:photo_app/Data/services/photos.dart';

final photoProvider = Provider<PhotoRepository>((ref) {
  final photoService = ref.watch(photoServiceProvider);
  return PhotoRepository(photoService);
});

class PhotoRepository extends IRepository {
  final PhotoServices _photoServices;

  PhotoRepository(this._photoServices);

  @override
  Future<List<Photos>> getPhoto() async {
    final photo = await _photoServices.getPhoto();
    return photo;
  }
}
