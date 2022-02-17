import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/model/liked_model.dart';
import 'package:photo_app/Data/repository/providers/locators.dart';
import 'package:photo_app/Data/services/auth/supabase_services.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends HookConsumerWidget {
  ProfileScreen({Key? key}) : super(key: key);

  // LikedImages? _likedImages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pro = inject.get<User>();
    final user = inject.get<LikedImages>();
    // _likedImages = ref.read(supaBaseProvider).likedData;

    useEffect((() {
      ref.read(supaBaseProvider).getImages();
    }));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                imageUrl: pro.userMetadata['avatar_url'],
                placeholder: (context, url) => const LoadingProgress(),
                errorWidget: (context, url, error) => SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/noimage.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                  ),
                ),
              ),
            ),
            Text(user.created.toString())
          ],
        ),
      ),
    );
  }
}
