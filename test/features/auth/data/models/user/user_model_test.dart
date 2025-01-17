import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = UserModel.empty();
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('USERMODEL:', () {
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

    test('toMap should return a [Map] with the right data', () {
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });

    test('toJson should return a [JSON] with the right data', () {
      final result = tModel.toJson();
      final tJson = jsonEncode({
        'id': '_empty.id',
        'name': '_empty.name',
        'createdAt': '_empty.createdAt',
        'avatar': '_empty.avatar',
      });

      expect(result, tJson);
    });

    test('copyWith should return a [UserModel] with different data', () {
      final updatedModel = tModel.copyWith(name: 'Updated Name');
      expect(updatedModel.name, equals('Updated Name'));
      expect(updatedModel.id, equals(tModel.id));
    });
  });
}
