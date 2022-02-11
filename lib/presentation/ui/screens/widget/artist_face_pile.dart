import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/helper/face_pile_helper.dart';
import 'package:photo_app/presentation/ui/vm/photos_vm.dart';

import '../../widgets/loading_progress.dart';

class ArtistFacePile extends HookConsumerWidget {
  const ArtistFacePile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(getPhotoProvider);
    return vm.when(
      idle: () => const LoadingProgress(),
      loading: () => const LoadingProgress(),
      error: (Object error, StackTrace? stackTrace) {
        return Text(error.toString());
      },
      success: (value) {
        // return FacePile(
        //   dimension: 40.6,
        //   space: 50,
        //   images: [
        //     NetworkImage(value![0].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[1].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[2].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[3].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[4].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[5].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[6].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[7].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[8].user!.profileImage!.medium.toString()),
        //     NetworkImage(value[9].user!.profileImage!.medium.toString()),
        //     // NetworkImage("https://i.pravatar.cc/300?img=2"),
        //     // NetworkImage("https://i.pravatar.cc/300?img=3"),
        //     // NetworkImage("https://i.pravatar.cc/300?img=4"),
        //   ],
        //   child: Text("3+"),
        // );
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent
              ],
              stops: [
                0.0,
                0.2,
                0.8,
                1.0
              ], // 10% purple, 80% transparent, 10% purple
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: SizedBox(
            height: 50,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemCount: value!.length,
              itemBuilder: (context, index) {
                final facePile = value[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(300.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: facePile.user!.profileImage!.small.toString(),
                    placeholder: (context, url) => const LoadingProgress(),
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
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 15,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
