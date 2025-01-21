import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/features/auth/data/datasourcees/auth_remote_data_source.dart';
import 'package:tdd_clean_architecture/features/auth/domain/repository/auth_repository.dart';

/// mock only dependencies, not classes you wanna test

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockClient extends Mock implements http.Client {}
