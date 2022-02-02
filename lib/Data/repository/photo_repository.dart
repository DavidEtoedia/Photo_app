import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/i_repo.dart';
import 'package:photo_app/Data/services/model/photo_by_id.dart';
import 'package:photo_app/Data/services/model/photo_by_tag.dart';
import 'package:photo_app/Data/services/photo_services.dart';
import 'package:photo_app/Data/services/model/photos.dart';

final photoProvider = Provider<PhotoRepository>((ref) {
  final photoService = ref.watch(photoServiceProvider);
  return PhotoRepository(photoService);
});

class PhotoRepository extends IRepository {
  final PhotoServices _photoServices;

  PhotoRepository(this._photoServices);

  @override
  Future<List<Photos>> getPhoto([int page = 1]) async {
    final photo = await _photoServices.getPhoto(page);
    return photo;
  }

  @override
  Future<PhotosById> photoById(String photoId) async {
    final id = await _photoServices.photoById(photoId);
    return id;
  }

  @override
  Future<PhotoByTag> photoByTag(String tag) async {
    final tagg = await _photoServices.photoByTag(tag);
    return tagg;
  }
}
