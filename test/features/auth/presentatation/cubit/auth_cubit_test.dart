import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/features/auth/domain/usecases/create_user.dart';
import 'package:tdd_clean_architecture/features/auth/domain/usecases/get_users.dart';
import 'package:tdd_clean_architecture/features/auth/presentatation/cubit/auth_cubit.dart';

import '../../../../test_helpers/mocks.mock.dart';

/// setUp runs before each test
///
/// thenThrow: Error Testing
/// thenReturn: when function is not async (we don't need to wait)
/// thenAnswer: when function is async
///
/// dartz: Right() => Success, Left() => Failure
/// right(null)) == void
///
/// equals is not always necessary, but often safer
///
/// use Right<dynamic>, if right side doesn't matter for test

void main() {
  late CreateUser createUser;
  late GetUsers getUsers;
  late AuthCubit cubit;

  const tCreateUserParams = CreateUserParams.empty();

  setUp(() {
    /// Initialize dependencies
    createUser = MockCreateUser();
    getUsers = MockGetUsers();
    cubit = AuthCubit(getUsers: getUsers, createUser: createUser);
    registerFallbackValue(tCreateUserParams);
  });

  /// after each test the bloc should be "destroyed"
  tearDown(() => cubit.close());

  test('AuthCubit initial state should be [AuthInitial]', () async {
    expect(cubit.state, const AuthInitial());
  });

  group('AuthCubit create User', () {
    blocTest<AuthCubit, AuthState>(
      'should emit [CreatingUser, UserCreated] when successful',
      build: () {
        when(() => createUser(params: any(named: 'params'))).thenAnswer(
          (_) async => const Right(null),
        );
        return cubit;
      },
      act: (cubit) => cubit.createUser(
        createdAt: tCreateUserParams.createdAt,
        name: tCreateUserParams.name,
        avatar: tCreateUserParams.avatar,
      ),

      /// list of states we expecting to emit
      expect: () => const [
        CreatingUser(),
        UserCreated(),
      ],
      verify: (_) {
        verify(() => createUser(params: tCreateUserParams)).called(1);
        verifyNoMoreInteractions(createUser);
      },
    );
  });
}
