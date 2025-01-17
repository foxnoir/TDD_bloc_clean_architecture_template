import 'package:tdd_clean_architecture/features/auth/data/models/user_model.dart';

/// talks to server
///
/// there are differnt types of data sources
///
/// - remote data source (e.g. talks to local storage, local cache)
/// - data source from services (e.g. api calls)

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}
