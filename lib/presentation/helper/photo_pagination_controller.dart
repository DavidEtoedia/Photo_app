// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:photo_app/Data/controller/generic_state_notifier.dart';
// import 'package:photo_app/Data/services/model/photo_exceptions.dart';
// import 'package:photo_app/Data/services/model/photos.dart';
// import 'package:photo_app/Data/services/photo_services.dart';
// import 'package:photo_app/presentation/helper/photo_pagination.dart';

// final photoPaginationControllerProvider =
//     StateNotifierProvider<PhotoPaginationController, dynamic>((ref) {
//   final photoService = ref.read(photoServiceProvider);
//   return PhotoPaginationController(photoService);
// });

// class PhotoPaginationController extends StateNotifier<PhotoPagination> {
//   PhotoPaginationController(this._photoServices, [PhotoPagination? state])
//       : super(state ?? PhotoPagination.initial()) {
//     getPhoto();
//   }

//   final PhotoServices _photoServices;

//   Future<void> getPhoto() async {
//     try {
//       final photos = await _photoServices.getPhoto(state.pages);
//       state = state.copyWith(
//           photos: [...state.photos, ...photos], pages: state.pages + 1);
//     } on PhotoException catch (e) {
//       state.copyWith(errorMessage: e.message);
//     }
//   }

//   void handleScrollWithIndex(int index) {
//     final ScrollController scrollController;
//     final itemPosition = index + 1;
//     final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;
//     final pageToRequest = itemPosition ~/ 20;

//     if (requestMoreData && pageToRequest + 1 >= state.pages) {
//       getPhoto();
//     }
//   }

//   // void setupScrollController(context) {
//   //   scrollController.addListener(() {
//   //     if (scrollController.position.atEdge) {
//   //       if (scrollController.position.pixels != 0) {
//   //         BlocProvider.of<PostsCubit>(context).loadPosts();
//   //       }
//   //     }
//   //   });
//   // }
// }
