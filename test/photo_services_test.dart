// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:photo_app/Data/constant/constant.dart';
// import 'package:photo_app/Data/services/model/failure.dart';
// import 'package:photo_app/Data/services/model/photos.dart';
// import 'package:photo_app/Data/services/photo_services.dart';

// class MockDio extends Mock implements Dio {}

// main() {
//   setUp(() {});
//   tearDown(() {});
//   test('my first test', () async {
//     //Arrange

//     final _mockDio = MockDio();
//     // final PhotoServices photoServices = PhotoServices(_mockDio);
//     // final result = await photoServices.getPhoto();

//     Future<List<Photos>> getPhoto([int pages = 1]) async {
//       final url = "photos?page=$pages&client_id=${Constants.apiKey}";

//       try {
//         final response = await _mockDio.get(url);
//         final res =
//             List<Photos>.from(response.data.map((x) => Photos.fromJson(x)));

//         return res;
//       } on DioError catch (e) {
//         if (e.response != null && e.response!.data != '') {
//           Failure result = Failure.fromJson(e.response!.data);
//           throw result.error!;
//         } else {
//           throw e.error;
//         }
//       }
//     }

//     //Act
//     final resultProvider = PhotoServices(_mockDio);
//     final resultX = await resultProvider.getPhoto();

//     //Assert
//     expectLater(resultX[0].id, 1);
//   });
// }
