import 'dart:convert';

import 'package:online_shop/models/users.dart';

import 'package:http/http.dart' as http;

class UsersServise {
  Future<List<Users>> fetchUsers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    final response = await http.get(url);

    final data = jsonDecode(response.body);

    List<Users> loadedUsers = [];

    if (data != null) {
      for (var user in data) {
        loadedUsers.add(Users.fromJson(user));
      }
    }
    return loadedUsers;
  }
}
