import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fly_ease/helper/extensions.dart';
import 'package:get/get.dart';

import '../../../helper/my_dialog.dart';
import 'user.dart';

class SignupController extends GetxController {
  final user = User();
  final etConfirmPw = TextEditingController();

  Future<void> onClick() async {
    final name = user.etFName.text;
    final email = user.etEmail.text;
    final pw = user.etPassword.text;
    final confirmPw = etConfirmPw.text;

    if (name.isValid && email.isValid && pw.isValid && confirmPw.isValid) {
      if (!email.isEmail) {
        MyDialog.error(msg: 'Please enter valid email address.');
        return;
      }

      if (pw != confirmPw) {
        MyDialog.error(msg: 'Password mismatch, please check.');
        return;
      }
      MyDialog.showProgressBar();
      // final isUserCreated = await ApiServices.createUser(user.toJson());
      log('isUserCreated --- ${user.toJson()}');
    } else {
      MyDialog.error(msg: 'All fields are mandatory');
    }
  }
}
