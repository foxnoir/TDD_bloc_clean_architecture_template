import 'package:equatable/equatable.dart';

/// blueprint of data passed around layers in specific feature
mixin User on Equatable {
  String get id;
  String get name;
  String get createdAt;
  String get avatar;

  @override
  List<Object?> get props => [id, name, createdAt, avatar];
}
