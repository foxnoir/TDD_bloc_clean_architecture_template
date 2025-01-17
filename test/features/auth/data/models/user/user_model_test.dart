// Unit Test file for user_model.dartimport 'package:dartz/dartz.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user/user_model.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = UserModel.empty();
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test('should be a subclass of [User] entity', () {
    expect(tModel, isA<User>());
  });

  group('fromMap', () {
    test(
      'should return s [UserModel] with the right data',
      () {
        final tJson = File('test/fixtures/user.json').readAsStringSync();
      },
    );
  });
}
