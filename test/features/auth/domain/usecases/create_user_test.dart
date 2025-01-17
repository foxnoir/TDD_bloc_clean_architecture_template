import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';
import 'package:tdd_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:tdd_clean_architecture/features/auth/domain/usecases/create_user.dart';

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
  late CreateUser usecase;
  late AuthRepository repo;

  const params = CreateUserParams.empty();

  setUp(() {
    repo = MockAuthRepository();
    usecase = CreateUser(repo);
  });

  test(
    'should call the [AuthRepo.createUser]',
    () async {
      /// that's what it should be
      when(
        () => repo.createUser(
          avatar: any(named: 'avatar'),
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      /// actually calling
      final result = await usecase(params: params);

      /// what we EXPECTED what it should be
      expect(result, equals(const Right<Failure, void>(null)));

      /// verify if the function was called and was called only once
      verify(
        () => repo.createUser(
          avatar: params.avatar,
          createdAt: params.createdAt,
          name: params.name,
        ),
      ).called(1);

      /// verify if there are no more interactions
      verifyNoMoreInteractions(repo);
    },
  );
}
