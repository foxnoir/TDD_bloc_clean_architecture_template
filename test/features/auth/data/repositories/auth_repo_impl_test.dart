import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/exception_message.dart';
import 'package:tdd_clean_architecture/core/errors/exceptions.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/features/auth/data/datasourcees/auth_remote_data_source.dart';
import 'package:tdd_clean_architecture/features/auth/data/repositories/auth_repo_impl.dart';

/// when returning void use Future.value() for testing

class MockAuthRemoteDataSrc extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthRepoImpl repoImpl;

  setUp(() {
    /// Initialize dependencies
    remoteDataSource = MockAuthRemoteDataSrc();
    repoImpl = AuthRepoImpl(remoteDataSource);
  });

  group('AUTH_REPO_IMPL createUser', () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';

    test(
      'should call the [AuthRemoteDataSource.createUser] and complete '
      'successfully when remote source call is successful',
      () async {
        ///  Arrange
        when(
          () => remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
          ),
        ).thenAnswer((_) async => Future.value());

        ///  Act
        final result = await repoImpl.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );

        ///  Assert
        expect(result, equals(const Right<dynamic, void>(null)));

        /// check that remote source's createUser gets called with right data
        verify(
          () => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          ),
        ).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [ServerFailure] when remote source call is unsuccessful',
      () async {
        //  arrange
        when(
          () => remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
          ),
        ).thenThrow(
          ApiException(
            message: ExceptionMessage.getMessage(ExceptionType.unknownError),
            statusCode: 500,
          ),
        );

        ///  Act
        final result = await repoImpl.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );

        ///  Assert
        expect(
          result,
          equals(
            Left<Failure, dynamic>(
              ApiFailure(
                message:
                    ExceptionMessage.getMessage(ExceptionType.unknownError),
                statusCode: 500,
              ),
            ),
          ),
        );

        /// check that remote source's createUser gets called with right data
        verify(
          () => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          ),
        ).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
