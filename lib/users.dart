import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/user.dart';
import 'package:http/http.dart' as http;

const usersURL = "https://jsonplaceholder.typicode.com/users";

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UsersState();
  }
}

class _UsersState extends State<Users> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future<void> getUsers() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');
    var data = jsonDecode(response.body) as List;
    List<User> users = data.map((u) => User.fromJson(u)).toList();
    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].company.name),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
