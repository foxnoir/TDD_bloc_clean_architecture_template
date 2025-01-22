import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/core/localization/localization_extensions.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/views/auth_screen.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/widgets/add_user_dialog.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/widgets/loading_column.dart';

import '../../../../test_helpers/mocks.mock.dart';

void main() {
  late MockAuthCubit mockAuthCubit;

  setUpAll(() {
    registerFallbackValue(FakeAuthState());
  });

  setUp(() {
    mockAuthCubit = MockAuthCubit();
  });

  Future<void> pumpAuthScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: BlocProvider<AuthCubit>.value(
          value: mockAuthCubit,
          child: const AuthView(),
        ),
      ),
    );
  }

  group('AuthScreen Widget Tests', () {
    testWidgets('displays LoadingColumn when state is GettingUsers',
        (tester) async {
      // Arrange
      when(() => mockAuthCubit.getUsers()).thenAnswer((_) async {});
      when(() => mockAuthCubit.state).thenReturn(const GettingUsers());

      // Act
      await pumpAuthScreen(tester);
      await tester.pump(); // Allow the state to be reflected

      // Assert
      expect(find.byType(LoadingColumn), findsOneWidget);
      expect(
          find.textContaining(FallbackStrings.fetchingUsers), findsOneWidget);
    });

    // testWidgets('displays LoadingColumn when state is CreatingUser',
    //     (tester) async {
    //   // Arrange
    //   when(() => mockAuthCubit.getUsers()).thenAnswer((_) async {});
    //   when(() => mockAuthCubit.state).thenReturn(const CreatingUser());

    //   // Act
    //   await pumpAuthScreen(tester);
    //   await tester.pump();

    //   // Assert
    //   expect(find.byType(LoadingColumn), findsOneWidget);
    //   expect(find.textContaining(FallbackStrings.creatingUser), findsOneWidget);
    // });

    // testWidgets('displays user list when state is UsersLoaded', (tester) async {
    //   // Arrange
    //   final users = [
    //     const UserModel(
    //         id: '1',
    //         name: 'John Doe',
    //         createdAt: '2023-01-01',
    //         avatar: 'http://example.com/avatar.jpg'),
    //   ];
    //   when(() => mockAuthCubit.getUsers()).thenAnswer((_) async {});
    //   when(() => mockAuthCubit.state).thenReturn(UsersLoaded(users));

    //   // Act
    //   await pumpAuthScreen(tester);
    //   await tester.pump();

    //   // Assert
    //   expect(find.byType(ListTile), findsOneWidget);
    //   expect(find.text('John Doe'), findsOneWidget);
    // });

    // testWidgets('displays AddUserDialog when FloatingActionButton is pressed',
    //     (tester) async {
    //   // Arrange
    //   when(() => mockAuthCubit.getUsers()).thenAnswer((_) async {});
    //   when(() => mockAuthCubit.state).thenReturn(const GettingUsers());

    //   // Act
    //   await pumpAuthScreen(tester);
    //   await tester.tap(find.byType(FloatingActionButton));
    //   await tester.pumpAndSettle();

    //   // Assert
    //   expect(find.byType(AddUserDialog), findsOneWidget);
    // });

    // testWidgets('shows SnackBar when state is AuthError', (tester) async {
    //   // Arrange
    //   when(() => mockAuthCubit.getUsers()).thenAnswer((_) async {});
    //   whenListen(
    //     mockAuthCubit,
    //     Stream.fromIterable([const AuthError('Error occurred')]),
    //     initialState: const GettingUsers(),
    //   );

    //   // Act
    //   await pumpAuthScreen(tester);
    //   await tester.pump(); // Allow the listener to react

    //   // Assert
    //   expect(find.text('Error occurred'), findsOneWidget);
    // });
  });
}
