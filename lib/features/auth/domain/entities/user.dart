import 'package:equatable/equatable.dart';

/// blueprint of data passed around layers in specific feature

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.avatar,
  });
  final int id;
  final String name;
  final String createdAt;
  final String avatar;

  @override
  List<Object?> get props => [id];
}
