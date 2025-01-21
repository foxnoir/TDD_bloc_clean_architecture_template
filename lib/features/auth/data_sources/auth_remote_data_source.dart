import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tdd_clean_architecture/core/errors/exceptions.dart';
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
    try {
      final response = await _client.post(
        Uri.https(ApiConfig.kBaseUrl, ApiConfig.users),
        body: jsonEncode({
          'createdAt': createdAt,
          'name': name,
          'avatar': avatar,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ApiException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      /// is triggered if an unexpected error occurs (NO!!! APiExpetion, could be internal / dart / error etc),
      /// this error is replaced by an ApiException
      /// statusCode 505 then indicates an unexpected error
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
