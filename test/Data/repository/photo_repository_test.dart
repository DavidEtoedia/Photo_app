import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:photo_app/Data/repository/photo_repository.dart';
import 'package:photo_app/Data/services/model/failure.dart';
import 'package:photo_app/Data/services/model/photo_by_id.dart';
import 'package:photo_app/Data/services/photo_services.dart';
import '../../resource.dart';

class MockService extends Mock implements PhotoServices {}

class MockDioResponse extends Mock implements Response {}

class MockDio extends Mock implements Dio {}

void main() {
  late MockService mockService;
  late PhotoServices photoServices;
  late PhotoRepository photoRepository;
  late MockDio httpClient;

  setUp(() {
    httpClient = MockDio();
    photoServices = PhotoServices(httpClient);
    mockService = MockService();

    photoRepository = PhotoRepository(mockService);
  });

  test('photo repository ...', () async {
    // final mockService = MockService();
    final response = MockDioResponse();

    // final repo = PhotoRepository(mockService);
    // when(() => mockService.photoById(any())).thenAnswer(
    //     (_) => Future.value(PhotosById.fromJson(MockResponse.photoId)));
    when(() => response.statusCode).thenReturn(200);
    when(() => response.data).thenReturn(
      MockResponse.photoId,
    );
    when(
      () => httpClient.get(any()),
    ).thenAnswer(
      (_) async => response,
    );
    await photoServices.photoById("wP2CZAf4u_c");
    expect(
      PhotosById.fromJson(response.data),
      isA<PhotosById>(),
    );

    // final expected = PhotosById.fromJson(MockResponse.photoId);

    // expect(res.id, expected.id);
  });

  test('when games service returns an error ...', () async {
    final response = MockDioResponse();

    when(() => response.statusCode).thenReturn(404);
    when(
      () => httpClient.get(any()),
    ).thenAnswer(
      (_) async => response,
    );

    final fail = Failure.fromJson(MockFailure.fail);
    expect(
      fail,
      isA<Failure>(),
    );
  });
}

class MockFailure {
  static var fail = {"staus": "status"};
}
