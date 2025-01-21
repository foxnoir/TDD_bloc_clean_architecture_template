import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

import '../../../../../test_helpers/fixtures/fixture_reader.dart';

void main() {
  final tModel = UserModel.empty();
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('USER_MODEL', () {
    test('should be a subclass of [User] entity', () {
      // Assert
      expect(tModel, isA<User>());
    });

    test(
      'fromMap should return a [UserModel] with the right data',
      () {
        // Arrange
        final expected = tModel;

        // Act
        final result = UserModelMapper.fromMap(tMap);

        // Assert
        expect(result, equals(expected));
      },
    );

    test(
      'fromJson should return a [UserModel] with the right data',
      () {
        // Arrange
        final expected = tModel;

        // Act
        final result = UserModelMapper.fromJson(tJson);

        // Assert
        expect(result, equals(expected));
      },
    );

    test('toMap should return a [Map] with the right data', () {
      // Arrange
      final expected = tMap;

      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(expected));
    });

    test('toJson should return a [JSON] with the right data', () {
      // Arrange
      final expected = jsonEncode({
        'id': 'test.id',
        'name': 'test.name',
        'createdAt': 'test.createdAt',
        'avatar': 'test.avatar',
      });

      // Act
      final result = tModel.toJson();

      // Assert
      expect(result, expected);
    });

    test('copyWith should return a [UserModel] with different data', () {
      // Arrange
      const updatedName = 'Updated Name';

      // Act
      final updatedModel = tModel.copyWith(name: updatedName);

      // Assert
      expect(updatedModel.name, equals(updatedName));
      expect(updatedModel.id, equals(tModel.id)); // Unchanged
    });
  });
}
