import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:photo_app/presentation/helper/likes_list.dart';
import 'package:photo_app/presentation/helper/photo_controller.dart';
import 'package:photo_app/presentation/helper/space_widget.dart';
import 'package:photo_app/presentation/ui/screens/widget/bottom_sheet.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';

class PhotoFeeds extends StatefulHookConsumerWidget {
  const PhotoFeeds({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoFeedsState();
}

class _PhotoFeedsState extends ConsumerState<PhotoFeeds> {
  @override
  void initState() {
    // ref.read(newPhotosProvider);
    super.initState();
  }

  final toggleProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(invoiceControllerProvider);
    // final toggle = ref.watch(toggleProvider.state);
    final likeState = ref.watch(likeProvider);
    // final collection = ref.watch(collectionProvider);
    // final user = inject.get<User>();
    final scrollController = ScrollController();

    return Expanded(
      child: SizedBox(
        // height: 200,
        child: ListView.separated(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          itemCount: controller.photo.length + (controller.isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < controller.photo.length) {
              ref
                  .read(invoiceControllerProvider.notifier)
                  .handleScrollWithIndex(index, scrollController);
              final value = controller.photo[index];
              return Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        child: CachedNetworkImage(
                          imageUrl: value.user!.profileImage!.medium.toString(),
                          placeholder: (context, url) =>
                              const LoadingProgress(),
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
                      const Space(10),
                      Text(
                        toBeginningOfSentenceCase(value.user!.name.toString())!,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                  const Space(10),
                  InkWell(
                    onTap: () {
                      context.goNamed('details', params: {'id': value.id!});
                    },
                    // context.navigate(SinglePhotoView(photoId: value.id!)),
                    child: SizedBox(
                      child: CachedNetworkImage(
                          errorWidget: (context, url, error) => SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/noimage.jpg',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                          imageUrl: value.urls!.regular.toString()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (likeState.photos.contains(value)) {
                                ref.read(likeProvider.notifier).remove(
                                    value.urls!.regular.toString(), value);
                              } else {
                                ref
                                    .read(likeProvider.notifier)
                                    .add(value.urls!.regular.toString(), value);

                                // print(likeState.images[0]);
                              }
                            },
                            child: Icon(
                              Icons.favorite_outlined,
                              color: likeState.photos.contains(value)
                                  ? Colors.red
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                builder: (
                                  context,
                                ) {
                                  return CollectionDisplay(
                                      image: value.urls!.regular.toString());
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10),
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.add_outlined,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10),
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Download',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });

              return const LoadingProgress();
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
// class PhotoFeeds extends HookConsumerWidget {
//   PhotoFeeds({Key? key}) : super(key: key);

//   final toggleProvider = StateProvider<bool>((ref) {
//     return false;
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = ref.watch(invoiceControllerProvider);
//     final toggle = ref.watch(toggleProvider.state);
//     final likeState = ref.watch(likeProvider);
//     final collection = ref.watch(collectionProvider);
//     // final user = inject.get<User>();
//     final scrollController = ScrollController();

//     return Expanded(
//       child: SizedBox(
//         // height: 200,
//         child: ListView.separated(
//           controller: scrollController,
//           physics: const AlwaysScrollableScrollPhysics(
//               parent: BouncingScrollPhysics()),
//           itemCount: controller.photo.length + (controller.isLoading ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index < controller.photo.length) {
//               ref
//                   .read(invoiceControllerProvider.notifier)
//                   .handleScrollWithIndex(index, scrollController);
//               final value = controller.photo[index];
//               return Column(
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(300.0),
//                         child: CachedNetworkImage(
//                           imageUrl: value.user!.profileImage!.small.toString(),
//                           placeholder: (context, url) =>
//                               const LoadingProgress(),
//                           errorWidget: (context, url, error) => SizedBox(
//                             height: 50,
//                             width: 50,
//                             child: Image.asset(
//                               'assets/images/noimage.jpg',
//                               width: MediaQuery.of(context).size.width,
//                               height: 100,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Space(10),
//                       Text(
//                         toBeginningOfSentenceCase(value.user!.name.toString())!,
//                         style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       )
//                     ],
//                   ),
//                   const Space(10),
//                   InkWell(
//                     onTap: () {
//                       context.goNamed('details', params: {'id': value.id!});
//                     },
//                     // context.navigate(SinglePhotoView(photoId: value.id!)),
//                     child: SizedBox(
//                       child: CachedNetworkImage(
//                           errorWidget: (context, url, error) => SizedBox(
//                                 height: 50,
//                                 width: 50,
//                                 child: Image.asset(
//                                   'assets/images/noimage.jpg',
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                               ),
//                           imageUrl: value.urls!.regular.toString()),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 10, right: 20),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 1, color: Colors.grey),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               if (likeState.photos.contains(value)) {
//                                 ref.read(likeProvider.notifier).remove(
//                                     value.urls!.regular.toString(), value);
//                               } else {
//                                 ref
//                                     .read(likeProvider.notifier)
//                                     .add(value.urls!.regular.toString(), value);

//                                 print(likeState.images[0]);
//                               }
//                             },
//                             child: Icon(
//                               Icons.favorite_outlined,
//                               color: likeState.photos.contains(value)
//                                   ? Colors.red
//                                   : Colors.grey[600],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 7,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             showModalBottomSheet(
//                                 context: context,
//                                 isScrollControlled: true,
//                                 shape: const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(20))),
//                                 builder: (
//                                   context,
//                                 ) {
//                                   return CollectionDisplay(
//                                       image: value.urls!.regular.toString());
//                                 });
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.only(
//                                 top: 15, bottom: 15, left: 10),
//                             height: 30,
//                             width: 50,
//                             decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.grey),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Icon(
//                               Icons.add_outlined,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         Container(
//                             margin: const EdgeInsets.only(
//                                 top: 15, bottom: 15, left: 10),
//                             height: 30,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.grey),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'Download',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey[600],
//                                 ),
//                               ),
//                             ))
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             } else {
//               Timer(const Duration(milliseconds: 30), () {
//                 scrollController
//                     .jumpTo(scrollController.position.maxScrollExtent);
//               });

//               return const LoadingProgress();
//             }
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return const SizedBox(height: 20);
//           },
//         ),
//       ),
//     );
//   }
// }
