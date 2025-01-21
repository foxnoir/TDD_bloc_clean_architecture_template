import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/network/api_config.dart';
import 'package:tdd_clean_architecture/features/auth/data_sources/auth_remote_data_source.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;
  late AuthRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = AuthRemoteDataSourceImpl(client);
    registerFallbackValue(Uri());
  });

  group('AUTH_REMOTE_DATA_SOURCE_IMPL', () {
    test(
      'should complete successfully when the status code is 200 or 201',
      () async {
        /// Arrange
        when(
          () => client.post(
            any(),
            body: any(named: 'body'),
          ),
        ).thenAnswer(
          (_) async => http.Response('User created successfully', 201),
        );

        /// Act
        final methodCall = remoteDataSource.createUser;

        /// Assert
        expect(
          methodCall(
            createdAt: 'test.createdAt',
            name: 'test.name',
            avatar: 'test.avatar',
          ),
          completes,
        );

        verify(
          () => client.post(
            Uri.https(ApiConfig.kBaseUrl, ApiConfig.users),
            body: jsonEncode({
              'createdAt': 'test.createdAt',
              'name': 'test.name',
              'avatar': 'test.avatar',
            }),
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );
  });
}
