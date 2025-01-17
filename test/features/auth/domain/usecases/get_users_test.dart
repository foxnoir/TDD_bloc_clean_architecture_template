// Unit Test file for get_users.dartimport 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:tdd_clean_architecture/features/auth/domain/usecases/get_users.dart';

import '../../../../mocks.mock.dart';

/// runs before each test
///
/// thenThrow: Error Testing
/// thenReturn: when function is not async (we don't need to wait)
/// thenAnswer: when function is async
///
/// dartz: Right() => Success, Left() => Failure
/// right(null)) == void
///
/// equals is always not necessary, often safer

void main() {
  late GetUsers usecase;
  late AuthRepository repo;

  final _tResponse = List<User>.empty();

  setUp(() {
    repo = MockAuthRepository();
    usecase = GetUsers(repo);
  });

  test(
    'should call the [AuthRepo.getUsers] and return a [List<User>]',
    () async {
      /// that's what it should be
      when(
        () => repo.getUsers(),
      ).thenAnswer(
        (_) async => Right(_tResponse),
      );

      /// actually calling
      final result = await usecase();

      /// what we EXPECTED what it should be
      expect(result, equals(Right<Failure, List<User>>(_tResponse)));

      /// verify if the function was called and was called only once
      verify(
        () => repo.getUsers(),
      ).called(1);

      /// verify if there are no more interactions
      verifyNoMoreInteractions(repo);
    },
  );
}
