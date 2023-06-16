import 'dart:convert';

import 'package:complusone_app/service/local_service/local_auth_service.dart';
import 'package:complusone_app/service/remote_service/remote_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalAuthService _localAuthService = LocalAuthService();

  @override
  void onInit() async {
    await _localAuthService.init();
    super.onInit();
  }

  void singUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result =
          await RemoteAuthService().signUp(email: email, password: password);
      if (result.status == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, token: token);
        if (userResult.status == 200) {
          user.value = User.fromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Welcome");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something went wrong. Please try again');
        }
      } else {
        EasyLoading.showError('Something went wrong. Please try again');
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['data']['token'];
        String refreshToken = json.decode(result.body)['data']['refreshToken'];
        var userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = User.fromJson(userResult.body);
          // print(user.value);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addRefreshToken(refreshToken: refreshToken);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Welcome to ComplusOne!");
          //go to Dashboard screen
          Navigator.pushNamed(Get.overlayContext!, "/dashboard");
        } else {
          EasyLoading.showError('Something wrong. Try again!!!');
        }
      } else {
        EasyLoading.showError('Username/password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Server error. Try again!!!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }
}
