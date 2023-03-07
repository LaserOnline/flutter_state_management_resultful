import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../service/shared_preferences_service.dart';
import '../api/config.dart';

class LoginController extends GetxController {
  final String url = Path.requestLogin;
  final sharedPreferencesService = SharedPreferencesService();
  RxBool isLoggedIn = false.obs;
  @override
  void onInit() {
    super.onInit();
    checkIsLoggedIn();
  }

  Future<void> checkIsLoggedIn() async {
    isLoggedIn(await SharedPreferencesService.getIsLoggedIn());
  }

  Future<void> setLoggedIn(bool value) async {
    await SharedPreferencesService.setIsLoggedIn(value);
    isLoggedIn(value);
  }

  Future<void> checkAuthen(String username, String password) async {
    if (username.isEmpty && password.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Empty"),
          content: Text("Empty"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            )
          ],
        ),
      );
    } else {
      try {
        final response = await http.post(
          Uri.parse(url),
          body: {'username': username, 'password': password},
        );
        final jsonData = jsonDecode(response.body);
        if (jsonData["Message"] == "Success") {
          setLoggedIn(true);
          Get.offAllNamed("/home");
        } else {
          Get.dialog(
            AlertDialog(
              title: Text("Login Failed"),
              content: Text("กรุณา Login ใหม่"),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("OK"),
                )
              ],
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
