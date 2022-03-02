import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/ui/vm/photo_by_tag_vm.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';

class PhotoTagScreen extends HookConsumerWidget {
  final String photoTag;
  final String id;
  final String description;
  const PhotoTagScreen(this.id,
      {required this.photoTag, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(photoByTagProvider(photoTag));
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  toBeginningOfSentenceCase(photoTag)!,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  toBeginningOfSentenceCase(description)!,
                  style: const TextStyle(
                      height: 1.4,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              description == ''
                  ? const SizedBox.shrink()
                  : const SizedBox(
                      height: 35,
                    ),
              vm.when(
                error: (Object error, StackTrace? stackTrace) {
                  return Text(error.toString());
                },
                loading: () => const LoadingProgress(),
                data: (value) {
                  return Expanded(
                    child: SizedBox(
                      // height: 550,
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        itemCount: value.results!.length,
                        itemBuilder: (context, index) {
                          final photo = value.results![index];
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
                                      imageUrl: photo.user.profileImage.small
                                          .toString(),
                                      placeholder: (context, url) =>
                                          const LoadingProgress(),
                                      errorWidget: (context, url, error) =>
                                          SizedBox(
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
                                    "${photo.user.firstName.toLowerCase()} ${photo.user.lastName.toLowerCase()}",
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
                              SizedBox(
                                child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const LoadingProgress(),
                                    errorWidget: (context, url, error) =>
                                        SizedBox(
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
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        Icons.favorite_outlined,
                                        size: 20,
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
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        Icons.add_outlined,
                                        size: 20,
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
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Download',
                                            style: TextStyle(
                                              fontSize: 13,
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
                },
              ),
            ],
          ),
        ));
  }
}
