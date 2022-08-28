import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/helper/Collections%20controller/collection_controller.dart';
import 'package:photo_app/presentation/helper/photo_controller.dart';
import 'package:photo_app/presentation/helper/space_widget.dart';

class CollectionDisplay extends HookConsumerWidget {
  final String image;
  const CollectionDisplay({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection = ref.watch(collectionProvider);
    final controller = ref.watch(invoiceControllerProvider);

    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.only(right: 23, left: 23, top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add to Collection',
                style: Theme.of(context).textTheme.headline2),
            const Space(20),
            InkWell(
                onTap: (() {
                  ref
                      .read(invoiceControllerProvider.notifier)
                      .addToItems(image);
                }),
                child: Container(
                    child: DottedBorder(
                        color: const Color.fromARGB(
                            255, 148, 148, 148), //color of dotted/dash line
                        strokeWidth: 1.5, //thickness of dash/dots
                        dashPattern: const [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          //inner container
                          height: 90, //height of inner container
                          width: double
                              .infinity, //width to 100% match to parent container.
                          color: const Color.fromARGB(255, 238, 238, 236),
                          child: Center(
                            child: Text('Create a New Collection',
                                style: Theme.of(context).textTheme.bodyText2),
                          ), //background color of inner container
                        )))),
            const Space(30),
            controller.list.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final val = controller.list[index];
                          return InkWell(
                            onTap: () {
                              if (collection.images.contains(image)) {
                                ref
                                    .read(collectionProvider.notifier)
                                    .remove(image);
                              } else {
                                ref
                                    .read(collectionProvider.notifier)
                                    .add(image);
                              }
                            },
                            child: DottedBorder(
                              color: const Color.fromARGB(255, 148, 148,
                                  148), //color of dotted/dash line
                              strokeWidth: 1.5, //thickness of dash/dots
                              dashPattern: const [6, 6],
                              //dash patterns, 10 is dash width, 6 is space width
                              child: collection.images.isEmpty
                                  ? SizedBox(
                                      height: 90, //height of inner container
                                      width: double.infinity,
                                      child: Container(
                                        //inner container
                                        height: 90, //height of inner container
                                        width: double
                                            .infinity, //width to 100% match to parent container.
                                        color: const Color.fromARGB(
                                            255, 238, 238, 236),
                                        child: Center(
                                          child: Text(val.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2),
                                        ), //background color of inner container
                                      ))
                                  : SizedBox(
                                      height: 90, //height of inner container
                                      width: double.infinity,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            collection.images[0].toString(),
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
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 30,
                          );
                        },
                        itemCount: controller.list.length),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
