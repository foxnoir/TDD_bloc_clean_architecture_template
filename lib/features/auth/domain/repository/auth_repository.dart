import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

/// Interface / contract what functions the feature has (not implementing
/// Domain layer is not directly dealing with Exceptions (clean architecture)
/// => uses dartz for seperating interfaces

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> createUser({
    required String id,
    required String createdAt,
    required String name,
  });

  ResultFuture<List<User>> getUsers();
}
