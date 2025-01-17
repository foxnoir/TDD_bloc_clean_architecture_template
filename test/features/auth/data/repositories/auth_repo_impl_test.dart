import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/features/auth/data/datasourcees/auth_remote_data_source.dart';
import 'package:tdd_clean_architecture/features/auth/data/repositories/auth_repo_impl.dart';

import '../../../../mocks.mock.dart';

/// when returning void use Future.value() for testing

void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthRepoImpl repoImpl;

  setUp(() {
    // Initialize dependencies
    remoteDataSource = MockAuthRemoteDataSource();
    repoImpl = AuthRepoImpl(remoteDataSource);
  });

  group('AUTH_REPO_IMPL createUser', () {
    test(
        'should call the [AuthRemoteDataSource.createUser] and complete '
        'successfully when remote source call is successful', () async {
      /// Arrange
      when(
        () => remoteDataSource.createUser(
          avatar: any(named: 'avatar'),
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
        ),
      ).thenAnswer(
        (_) async => Future.value(),
      );

      const createdAt = 'whatever.createdAt';
      const name = 'whatever.name';
      const avatar = 'whatever.avatar';
      //  act
      final result = await repoImpl.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

      //  assert
      expect(result, equals(const Right(null)));

      /// check taht remote source's createUser gets called with right data
      verify(
        () => remoteDataSource.createUser(
          avatar: avatar,
          createdAt: createdAt,
          name: name,
        ),
      ).called(1);
      verifyNoMoreInteractions(repoImpl);
    });
  });
}
