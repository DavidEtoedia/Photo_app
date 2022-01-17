import 'package:photo_app/Data/services/model/photo_by_id.dart';
import 'package:photo_app/Data/services/model/photo_by_tag.dart';
import 'package:photo_app/Data/services/model/photos.dart';

abstract class IRepository {
  Future<List<Photos>> getPhoto();
  Future<PhotosById> photoById(String photoId);
  Future<PhotoByTag> photoByTag(String tag);
}
