import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                    imageUrl: facePile.user!.profileImage!.medium.toString(),
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
