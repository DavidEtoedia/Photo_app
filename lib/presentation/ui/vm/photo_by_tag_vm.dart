import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/providers/service_providers.dart';
import 'package:photo_app/Data/services/model/photo_by_tag.dart';

final photoByTagProvider =
    FutureProvider.autoDispose.family<PhotoByTag, String>((ref, tag) async {
  return ref.watch(photoProvider).photoByTag(tag);
});
