import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './MessageLogadControllert.dart';
import '../api/config.dart';

class MessageSend extends GetxController {
  final String url = Path.requestMessageSend;
  final MessageLoadController loadController = Get.put(MessageLoadController());
  @override
  void onInit() {
    super.onInit();
  }

  Future Send(String message) async {
    if (message.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Empty"),
          content: Text("Message Empty"),
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
      final response = await http.post(
        Uri.parse(url),
        body: {'message': message},
      );
      final jsonData = jsonDecode(response.body);
      if (jsonData["Message"] == "Success") {
        //* เรียก method fetchAllAndUpdate() ของ MessageLoadController เพื่ออัพเดทข้อมูลใหม่
        loadController.fetchAllAndUpdate();
      }
    }
  }
}
