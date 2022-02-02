import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:photo_app/Data/services/model/photos.dart';
import 'package:photo_app/presentation/helper/photo_controller.dart';
import 'package:photo_app/presentation/ui/screens/photo_by_id_screen.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';
import 'package:photo_app/presentation/utils/navigator.dart';

class NewList extends HookConsumerWidget {
  const NewList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(invoiceControllerProvider);
    final scrollController = ScrollController();

    return Expanded(
      child: SizedBox(
        // height: 200,
        child: ListView.separated(
          controller: scrollController,
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
                          imageUrl: value.user!.profileImage!.small.toString(),
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
                        toBeginningOfSentenceCase(value.user!.name.toString())!,
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
                    onTap: () =>
                        context.navigate(SinglePhotoView(photoId: value.id!)),
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
                            border: Border.all(width: 1, color: Colors.grey),
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
              Timer(Duration(milliseconds: 30), () {
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

class MovieBox extends StatelessWidget {
  final Photos? photos;

  const MovieBox({Key? key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(photos!.likes.toString())],
    );
  }
}
