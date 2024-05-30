import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;
  final String creationAt;
  final String updateAt;

  Users({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updateAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return _$UsersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UsersToJson(this);
  }
}
