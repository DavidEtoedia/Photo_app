import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/providers/locators.dart';
import 'package:photo_app/Data/services/auth/supabase_services.dart';
import 'package:photo_app/presentation/helper/image_provider.dart';
import 'package:photo_app/presentation/helper/space_widget.dart';
import 'package:photo_app/presentation/ui/screens/new_list.dart';
import 'package:photo_app/presentation/ui/screens/profile_screen.dart';
import 'package:photo_app/presentation/ui/screens/widget/artist_face_pile.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';
import 'package:photo_app/presentation/utils/navigator.dart';
import 'package:supabase/supabase.dart' as sbase;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect((() {
      ref.read(supaBaseProvider.notifier).getImages();

      return null;
    }));
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(40),
            const UnsplashTitle(),
            const Space(30),
            const ArtistFacePile(),
            const Space(30),
            PhotoFeeds()
          ],
        ),
      )),
    );
  }
}

class UnsplashTitle extends HookConsumerWidget {
  const UnsplashTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pro = inject.get<sbase.User>();

    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Space(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                AppImages.unsplashSymbol,

                // height: 100,
                width: 30,
              ),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color(0XFFeeeeee),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Search photos',
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.goNamed(
                    'profile',
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300.0),
                  child: CachedNetworkImage(
                    height: 40,
                    width: 40,
                    imageUrl: pro.userMetadata['avatar_url'],
                    placeholder: (context, url) => const LoadingProgress(),
                    errorWidget: (context, url, error) => SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'assets/images/noimage.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
