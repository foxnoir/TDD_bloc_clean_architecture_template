import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/exceptions.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/data/datasourcees/auth_remote_data_source.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_architecture/features/auth/domain/repository/auth_repository.dart';

/// talks to datasource
/// gets result/exception returns result/failure
/// implements methods

class AuthRepoImpl implements AuthRepository {
  const AuthRepoImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFutureVoid createUser({
    required String avatar,
    required String createdAt,
    required String name,
  }) async {
    try {
      await _remoteDataSource.createUser(
        avatar: avatar,
        createdAt: createdAt,
        name: name,
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
