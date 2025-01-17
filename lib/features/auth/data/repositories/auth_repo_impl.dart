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
  ResultVoid createUser(
      {required String avatar,
      required String createdAt,
      required String name}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
