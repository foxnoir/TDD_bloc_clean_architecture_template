/// remote = talks to "outside" server
///
/// don't use typeDefs here (e.g. Resultfuture, ResultVoid)
/// if errror occurs in datasource you throw CUSTOM exception
///
///  ALWAYS returns model NOT !!! entities
library;

import 'package:tdd_clean_architecture/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> createUser({
    required String avatar,
    required String createdAt,
    required String name,
  });

  Future<List<UserModel>> getUsers();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> createUser({
    required String avatar,
    required String createdAt,
    required String name,
  }) async {}

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
