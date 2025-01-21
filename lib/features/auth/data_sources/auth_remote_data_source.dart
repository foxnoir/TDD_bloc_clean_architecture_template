import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tdd_clean_architecture/core/network/api_config.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user_model.dart';

/// talks to server
/// catchs exception
///
/// there are differnt types of data sources
/// - remote data source (e.g. talks to local storage, local cache)
/// - data source from services (e.g. api calls)

abstract class AuthRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client);
  final http.Client _client;

  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    await _client.post(
      Uri.https(ApiConfig.kBaseUrl, ApiConfig.users),
      body: jsonEncode({
        'createdAt': createdAt,
        'name': name,
        'avatar': avatar,
      }),
    );
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
