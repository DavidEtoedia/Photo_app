import 'package:photo_app/Data/repository/i_repo.dart';

import 'package:photo_app/Data/services/model/photo_by_id.dart';
import 'package:photo_app/Data/services/model/photo_by_tag.dart';
import 'package:photo_app/Data/services/photo_services.dart';

import '../services/model/freezed model/photo_class/photo_class.dart';

class PhotoRepository extends IRepository {
  final PhotoServices _photoServices;

  PhotoRepository(this._photoServices);

  @override
  Future<List<Photo>> getPhoto([int page = 1]) async {
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
