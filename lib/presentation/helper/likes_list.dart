import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/services/auth/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

import '../../Data/services/model/freezed model/photo_class/photo_class.dart';

class LikedPhotos extends ChangeNotifier {
  LikedPhotos(this.ref);

  final Ref ref;

  final List<Photo> _photos = [];
  final List<String> _images = [];

  final clientt = supa.Supabase.instance;
  List<String> get images => _images;
  List<Photo> get photos => _photos;

  void remove(String photos, Photo photo) {
    final index = _photos.indexOf(photo);
    _photos.removeAt(index);
    notifyListeners();
  }

  void add(String photos, Photo photo) {
    _images.add(photos);
    ref.read(supaBaseProvider.notifier).postImages(_images, DateTime.now());
    _photos.add(photo);
    notifyListeners();
  }

  // Future<supa.PostgrestResponse> postImages(
  //   // List imageList,
  //   DateTime date,
  // ) async {
  //   final user = clientt.client.auth.currentUser;

  //   try {
  //     final res = await clientt.client
  //         .from('images')
  //         .upsert(
  //             LikedImages(id: user!.id, image: _images, created: date).toJson())
  //         .execute();

  //     notifyListeners();
  //     return res;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}

final likeProvider =
    ChangeNotifierProvider<LikedPhotos>(((ref) => LikedPhotos(ref)));
