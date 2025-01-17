import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user/user_model.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = UserModel.empty();
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  /// with mappable toMap/toJson testing not neeeded

  test('should be a subclass of [User] entity', () {
    expect(tModel, isA<User>());
  });

  test(
    'fromMap should return a [UserModel] with the right data',
    () {
      final result = UserModelMapper.fromMap(tMap);
      expect(result, equals(tModel));
    },
  );

  test(
    'fromJson should return a [UserModel] with the right data',
    () {
      final result = UserModelMapper.fromJson(tJson);
      expect(result, equals(tModel));
    },
  );
}
