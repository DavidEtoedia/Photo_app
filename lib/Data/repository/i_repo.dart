import 'package:photo_app/Data/services/model/photo_by_id.dart';
import 'package:photo_app/Data/services/model/photo_by_tag.dart';

import '../services/model/freezed model/photo_class/photo_class.dart';

abstract class IRepository {
  Future<List<Photo>> getPhoto([int page = 1]);
  Future<PhotosById> photoById(String photoId);
  Future<PhotoByTag> photoByTag(String tag);
}
