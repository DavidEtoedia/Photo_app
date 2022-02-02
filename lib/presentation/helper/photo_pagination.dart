// import 'package:flutter/foundation.dart';

// import 'package:photo_app/Data/services/model/photos.dart';

// class PhotoPagination {
//   final List<Photos> photos;
//   final int pages;
//   final String errorMessage;
//   PhotoPagination({
//     required this.photos,
//     required this.pages,
//     required this.errorMessage,
//   });

//   PhotoPagination.initial()
//       : photos = [],
//         pages = 1,
//         errorMessage = '';

//   bool get refreshError => errorMessage != '' && photos.length <= 10;

//   PhotoPagination copyWith({
//     List<Photos>? photos,
//     int? pages,
//     String? errorMessage,
//   }) {
//     return PhotoPagination(
//       photos: photos ?? this.photos,
//       pages: pages ?? this.pages,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   @override
//   String toString() =>
//       'PhotoPagination(photos: $photos, pages: $pages, errorMessage: $errorMessage)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is PhotoPagination &&
//         listEquals(other.photos, photos) &&
//         other.pages == pages &&
//         other.errorMessage == errorMessage;
//   }

//   @override
//   int get hashCode => photos.hashCode ^ pages.hashCode ^ errorMessage.hashCode;
// }
