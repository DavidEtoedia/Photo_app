// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:photo_app/Data/constant/constant.dart';
// import 'package:photo_app/Data/repository/i_repo.dart';
// import 'package:photo_app/Data/repository/photo_repository.dart';
// import 'package:photo_app/Data/services/model/photos.dart';
// import 'package:photo_app/Data/services/photo_services.dart';

// import 'photo_services_test.mocks.dart';

// class MockDio extends Mock implements Dio {}

// @GenerateMocks([MockDio])
// void main() {
//   MockMockDio _mockFetch = MockMockDio();
//   PhotoServices? _photoServices;
//   Photos? photos;
//   setUp(() {
//     _photoServices = PhotoServices(_mockFetch);
//   });

//   tearDown(() {});
//   test('fetch photo Data', () async {
//     //Arrange
//     // final fetch = MockMockDio();

//     // final PhotoServices photoServices = PhotoServices(fetch);
//     int pages = 1;

//     final url = "photos?page=$pages&client_id=${Constants.apiKey}";

//     when(_mockFetch.get(url)).thenAnswer((_) async => Future.value(Response(
//         requestOptions: RequestOptions(
//             data: photos, path: Constants.apiUrl, baseUrl: Constants.apiUrl))));

//     // final result = PhotoServices(fetch);

//     final res = await _photoServices!.getPhoto();

//     //Act

//     // final res = result.getPhoto();

//     //Assert

//     expect(res.length, 10);
//   });
// }
