import 'package:flutter/material.dart';

class User {
  final etFName = TextEditingController();
  final etLName = TextEditingController();
  final etEmail = TextEditingController();
  final etPassword = TextEditingController();
  String? avatar;

  User();

  User.fromJson(Map<String, dynamic> json) {
    etFName.text = json['name'] ?? '';
    etPassword.text = json['password'] ?? '';
    etEmail.text = json['email'] ?? '';
    avatar = json['avatar'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['name'] = '${etFName.text} ${etLName.text}';
    data['password'] = etPassword.text;
    data['email'] = etEmail.text;
    data['avatar'] = 'https://picsum.photos/800';
    return data;
  }
}
