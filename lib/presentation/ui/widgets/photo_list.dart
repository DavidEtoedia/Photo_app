import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/ui/vm/photos_vm.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';

class PhotoList extends HookConsumerWidget {
  const PhotoList({Key? key}) : super(key: key);

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
                itemCount: value!.length,
                itemBuilder: (context, index) {
                  final photo = value[index];
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: CachedNetworkImage(
                                imageUrl:
                                    photo.user!.profileImage!.small.toString(),
                              ),
                              // decoration:
                              //     const BoxDecoration(shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${photo.user!.firstName!.toLowerCase()} ${photo.user!.lastName!.toLowerCase()}",
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  Image.network(photo.blurHash!),
                              imageUrl: photo.urls!.regular.toString()),
                        )
                      ],
                    ),
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
