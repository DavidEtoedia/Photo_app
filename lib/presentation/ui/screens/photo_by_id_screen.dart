import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:photo_app/presentation/ui/screens/photo_by_tag_screen.dart';

import 'package:photo_app/presentation/ui/vm/photos_by_id_vm.dart';
import 'package:photo_app/presentation/ui/widgets/loading_progress.dart';
import 'package:photo_app/presentation/utils/navigator.dart';

class SinglePhotoView extends HookConsumerWidget {
  final String photoId;
  const SinglePhotoView({required this.photoId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(photoByIdProvider(photoId));
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: vm.when(
          loading: () => const LoadingProgress(),
          error: (Object error, StackTrace? stackTrace) {
            return Text(error.toString());
          },
          data: (value) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        child: CachedNetworkImage(
                          imageUrl: value.user!.profileImage.toString(),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toBeginningOfSentenceCase(
                                value.user!.name.toString())!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          value.user?.forHire == true
                              ? Row(
                                  children: const [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'Available for hire',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black38),
                                    ),
                                  ],
                                )
                              : const Text(
                                  'Unavailable for hire',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black38),
                                ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                        toBeginningOfSentenceCase(
                            value.altDescription.toString())!,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                        imageUrl: value.urls!.small.toString()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Views:   ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600]),
                            children: [
                              TextSpan(
                                  text: value.views.toString(),
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Downloads:   ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600]),
                            children: [
                              TextSpan(
                                  text: value.downloads.toString(),
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        value.location!.name == null
                            ? const Text('Unknown',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600))
                            : Text(value.location!.name.toString(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        value.exif!.name == null
                            ? const Text('Unknown',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600))
                            : Text(value.exif!.name.toString(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.tagsPreview!.length,
                      itemBuilder: (context, index) {
                        final tagss = value.tags![index];
                        return Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.navigate(PhotoTagScreen(
                                    photoTag: tagss.title.toString(),
                                    description:
                                        tagss.source?.description.toString() ??
                                            '',
                                  ));
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 7, bottom: 7),
                                    color: Colors.black12,
                                    child: Text(
                                      toBeginningOfSentenceCase(
                                          tagss.title.toString())!,
                                      style: const TextStyle(
                                          color: Colors.black38),
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 0,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
