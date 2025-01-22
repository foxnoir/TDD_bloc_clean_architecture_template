import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:tdd_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:tdd_clean_architecture/features/auth/domain/usecases/create_user.dart';
import 'package:tdd_clean_architecture/features/auth/domain/usecases/get_users.dart';

/// mock only dependencies, not classes you wanna test

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockClient extends Mock implements http.Client {}

class MockCreateUser extends Mock implements CreateUser {}

class MockGetUsers extends Mock implements GetUsers {}
