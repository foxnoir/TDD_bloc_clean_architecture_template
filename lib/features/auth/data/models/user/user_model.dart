import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdd_clean_architecture/core/utils/type_defs.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends Equatable with _$UserModel, User {
  const factory UserModel({
    required String id,
    required String name,
    required String createdAt,
    required String avatar,
  }) = _UserModel;

  const UserModel._();

  /// Leere UserModel-Instanz
  factory UserModel.empty() => const UserModel(
        id: '1',
        name: '_empty.name',
        createdAt: '_empty.createdAt',
        avatar: '_empty.avatar',
      );

  /// JSON Parsing
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromMap(DataMap map) => UserModel(
        id: map['id'] as String,
        name: map['name'] as String,
        createdAt: map['createdAt'] as String,
        avatar: map['avatar'] as String,
      );

  DataMap toMap() => toJson();
}
