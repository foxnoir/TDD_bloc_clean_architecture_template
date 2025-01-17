// Unit Test file for user_model.dartimport 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user/user_model.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

void main() {
  test('should be a subclass of [User] entity', () {
    const _tModel = UserModel.empty();

    expect(_tModel, isA<User>());
  });

  group('fromMap', () {
    test(
      'should return s [UserModel] with the right data',
      () {},
    );
  });
}
