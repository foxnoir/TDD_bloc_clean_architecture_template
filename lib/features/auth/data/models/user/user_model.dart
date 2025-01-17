import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean_architecture/features/auth/domain/entities/user.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel extends Equatable with User {
  const UserModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  factory UserModel.empty() => const UserModel(
        id: '_empty.id',
        name: '_empty.name',
        createdAt: '_empty.createdAt',
        avatar: '_empty.avatar',
      );

  @override
  final String id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final String avatar;

  @override
  List<Object?> get props => [id, name, createdAt, avatar];
}
