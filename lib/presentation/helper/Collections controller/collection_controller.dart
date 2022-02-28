import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

import '../../../Data/services/model/photos.dart';

class Collections extends ChangeNotifier {
  Collections(this.ref);

  final Ref ref;

  final List<String> _images = [];
  final List<String> _photos = [];
  final List<String> _img = [];

  final clientt = supa.Supabase.instance;
  List<String> get images => _images;

  void remove(String photos) {
    final index = _images.indexOf(photos);
    _images.removeAt(index);
    notifyListeners();
  }

  void add(
    String photos,
  ) {
    _images.insert(0, photos);
    // ref.read(supaBaseProvider.notifier).postImages(_images, DateTime.now());
    // _photos.add(photo);
    notifyListeners();
  }
}

final collectionProvider =
    ChangeNotifierProvider<Collections>(((ref) => Collections(ref)));
