import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:photo_app/presentation/ui/vm/photos_vm.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';

class PhotoLis extends HookConsumerWidget {
  PhotoLis({Key? key}) : super(key: key);

  final counterStateProvider = StateProvider<int>((ref) {
    return 1;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoList = ref.watch(getPhotoProvider);

    return photoList.when(
        idle: () => const LoadingProgress(),
        loading: () => const LoadingProgress(),
        error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
        },
        success: (value) {
          return Expanded(
            child: SizedBox(
              // height: 300,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: value!.length,
                itemBuilder: (context, index) {
                  final photo = value[index];

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
                              imageUrl:
                                  photo.user!.profileImage!.small.toString(),
                              placeholder: (context, url) =>
                                  const LoadingProgress(),
                              errorWidget: (context, url, error) => SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/noimage.jpg',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            toBeginningOfSentenceCase(
                                photo.user!.name.toString())!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        // onTap: () => context
                        //     .navigate(SinglePhotoView(photoId: photo.id!)),
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
                              imageUrl: photo.urls!.regular.toString()),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.favorite_outlined,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 10),
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add_outlined,
                                color: Colors.grey[600],
                              ),
                            ),
                            const Spacer(),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 10),
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
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
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 50,
                  );
                },
              ),
            ),
          );
        });
  }
}
