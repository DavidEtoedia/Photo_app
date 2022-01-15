import 'package:photo_app/Data/services/photos.dart';

abstract class IRepository {
  Future<List<Photos>> getPhoto();
}
