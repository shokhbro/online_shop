import 'package:online_shop/models/users.dart';
import 'package:online_shop/servise/users_http_servise.dart';

class UsersController {
  final userhttpServise = UsersServise();

  Future<List<Users>> getUsers() async {
    List<Users> users = await userhttpServise.fetchUsers();
    return users;
  }
}


