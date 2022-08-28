import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/providers/locators.dart';
import 'package:photo_app/Data/services/auth/auth_state.dart';
import 'package:photo_app/Data/services/auth/supabase_services.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../helper/space_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends AuthState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: HookConsumer(builder: (context, ref, child) {
        final pro = inject.get<User>();
        final likedImages = ref.watch(supaBaseProvider);
        final signOut = ref.watch(supaBaseProvider);
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
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
                  ),
                  const Space(10),
                  Text(
                    pro.userMetadata['full_name'],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      signOut.googleSignOut();
                    },
                    child: const Text(
                      'Sign out',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              const Space(20),
              Expanded(
                child: ListView.separated(
                  itemCount: likedImages.like![0].url!.length,
                  itemBuilder: (context, index) {
                    final img = likedImages.like![0].url![index];
                    return SizedBox(
                      height: 200,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        imageUrl: img,
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

// class ProfileScreen extends HookConsumerWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   // LikedImages? _likedImages;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final pro = inject.get<User>();
//     final likedImages = ref.watch(supaBaseProvider);
//     final signOut = ref.watch(supaBaseProvider);

//     return Scaffold(
//       appBar: AppBar(
//         // automaticallyImplyLeading: false,
//         iconTheme: const IconThemeData(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: 50,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(300.0),
//                     child: CachedNetworkImage(
//                       fit: BoxFit.cover,
//                       height: 100,
//                       width: 100,
//                       imageUrl: pro.userMetadata['avatar_url'],
//                       placeholder: (context, url) => const LoadingProgress(),
//                       errorWidget: (context, url, error) => SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset(
//                           'assets/images/noimage.jpg',
//                           width: MediaQuery.of(context).size.width,
//                           height: 100,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Space(10),
//                 Text(
//                   pro.userMetadata['full_name'],
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 const Spacer(),
//                 InkWell(
//                   onTap: () {
//                     signOut.googleSignOut();
//                   },
//                   child: const Text(
//                     'Sign out',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 )
//               ],
//             ),
//             const Space(20),
//             Expanded(
//               child: ListView.separated(
//                 itemCount: likedImages.like![0].url!.length,
//                 itemBuilder: (context, index) {
//                   final img = likedImages.like![0].url![index];
//                   return SizedBox(
//                     height: 200,
//                     child: CachedNetworkImage(
//                       fit: BoxFit.cover,
//                       height: 100,
//                       width: 100,
//                       imageUrl: img,
//                       placeholder: (context, url) => const LoadingProgress(),
//                       errorWidget: (context, url, error) => SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset(
//                           'assets/images/noimage.jpg',
//                           width: MediaQuery.of(context).size.width,
//                           height: 100,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const SizedBox(
//                     height: 20,
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
