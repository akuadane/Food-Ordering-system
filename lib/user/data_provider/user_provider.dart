import 'dart:convert';

import 'package:flut_food/api_config_files.dart';
import 'package:flut_food/user/model/models.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider {
  final Client httpClient;

  UserProvider(this.httpClient) : assert(httpClient != null);

  Future<User> getUserByUserName(String username) async {
    final response = await this.httpClient.get(
      "$baseURL/v1/admin/username/$username",
      headers: <String, String>{
        'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error fetching user");
  }

  Future<User> getUserById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id;

    if (prefs.getInt('USER_ID') == null) {
      throw Exception("Error fetching user");
    } else
      id = prefs.getInt('USER_ID');

    final response = await this.httpClient.get(
      "$baseURL/v1/admin/user/$id",
      headers: <String, String>{
        'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error fetching user");
  }

  Future<User> signInUser(String username, String password) async {
    print("$baseURL/v1/admin/username/$username");
    final response = await this.httpClient.get(
      "$baseURL/v1/admin/username/$username",
      headers: <String, String>{
        'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
      },
    );
    print("In sign in method");
    if (response.statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));

      if (user.password == password) return user;
      throw Exception("Wrong Credential");
    }
    throw Exception("Error signing in user");
  }

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      "$baseURL/v1/admin/users",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
      },
      body: jsonEncode(<String, dynamic>{
        "username": user.userName,
        "email": user.email,
        "fullname": user.fullName,
        "phone": user.phone,
        "password": user.password
      }),
    );
    print(response.statusCode);

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error creating user");
  }

  Future<void> updateUser(User user) async {
    final response = await this.httpClient.put(
          "$baseURL/v1/admin/users/${user.id}",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'api-key': "9fe8c794-32fd-4dba-b57e-68194327285d",
          },
          body: jsonEncode(<String, dynamic>{
            "username": user.userName,
            "email": user.email,
            "fullname": user.fullName,
            "phone": user.phone,
            "password": user.password
          }),
        );

    if (response.statusCode != 200) throw Exception("Error updating user data");
  }

  Future<void> deleteUser(int id) async {
    final response =
        await this.httpClient.delete("$baseURL/v1/admin/users/$id");

    if (response.statusCode != 204) {
      throw Exception("Error deleting user");
    }
  }
}
