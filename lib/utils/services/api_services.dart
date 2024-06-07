import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../helper/my_dialog.dart';
import '../constants/api_constants.dart';
import 'pref.dart';

class ApiServices {
  static Future<dynamic> getApi({required String endpoint}) async {
    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        return jsonBody;
      } else {
        log('Something went wrong.');
      }
    } catch (e) {
      log('err --- ${e.toString()}');
    }
  }

  static Future<bool> createUser(Map<String, dynamic> body) async {
    try {
      MyDialog.showProgressBar();
      final response =
          await http.post(Uri.parse(ApiConstants.createUser), body: body);

      //
      if (response.statusCode == 201) {
        Get.back();
        return true;
      }
      Get.back();
      return false;
    } catch (e) {
      Get.back();
      MyDialog.error(msg: 'Something went wrong.');
      log('err --- ${e.toString()}');
      return false;
    }
  }

  static Future<bool> authenticateUser(
      {required String email, required String password}) async {
    try {
      MyDialog.showProgressBar();
      final response = await http.post(Uri.parse(ApiConstants.authenticateUser),
          body: {'email': email, 'password': password});

      //
      final jsonBody = jsonDecode(response.body);

      //
      if (response.statusCode == 201) {
        Get.back();
        Pref.userToken = jsonBody['access_token'];
        return true;

        //
      } else if (jsonBody['message'] == 'Unauthorized') {
        Get.back();
        MyDialog.error(msg: 'User not found.');
        return false;
      }
      Get.back();
      return false;
    } catch (e) {
      Get.back();
      MyDialog.error(msg: 'Something went wrong.');
      log('err --- ${e.toString()}');
      return false;
    }
  }

  static Future<bool> getUserProfile({required String accessToken}) async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.authenticateUser), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken'
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      MyDialog.error(msg: 'Something went wrong.');
      return false;
    }
  }
}
