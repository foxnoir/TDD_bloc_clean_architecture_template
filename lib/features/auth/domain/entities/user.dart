import 'package:equatable/equatable.dart';

/// blueprint of data passed around layers in specific feature

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  /// for testing
  const User.empty()
      : this(
          avatar: 'empty.avatar',
          createdAt: 'empty.createdAt',
          id: 0,
          name: 'empty.name',
        );

  final int id;
  final String name;
  final String createdAt;
  final String avatar;

  @override
  List<Object?> get props => [id];
}
