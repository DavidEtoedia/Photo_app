import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/model/liked_model.dart';
import 'package:photo_app/Data/repository/providers/locators.dart' as locate;
import 'package:photo_app/Data/services/auth/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

import '../../Data/services/model/photos.dart';

class LikedPhotos extends ChangeNotifier {
  LikedPhotos(this.ref);

  final Ref ref;

  final List<Photos> _photos = [];
  final List<String> _images = [];
  final Photos photo = Photos();

  final clientt = supa.Supabase.instance;
  List<String> get images => _images;
  List<Photos> get photos => _photos;

  void remove(Photos photos) {
    final index = _photos.indexOf(photos);
    _photos.removeAt(index);
    notifyListeners();
  }

  void add(String photos, Photos photo) {
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
