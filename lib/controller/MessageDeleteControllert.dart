import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './MessageLogadControllert.dart';
import '../api/config.dart';

class MessageDeleteController extends GetxController {
  final String url = Path.requesMessageDelete;
  final MessageLoadController loadController = Get.put(MessageLoadController());

  Future Delete(String id) async {
    final response = await http.delete(
      Uri.parse(url),
      body: {'delete_id': id},
    );
    final jsonData = jsonDecode(response.body);
    if (jsonData["Message"] == "Success") {
      //* เรียก method fetchAllAndUpdate() ของ MessageLoadController เพื่ออัพเดทข้อมูลใหม่
      loadController.fetchAllAndUpdate();
    }
  }
}
