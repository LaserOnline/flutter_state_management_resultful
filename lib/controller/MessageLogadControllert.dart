import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Message_Models.dart';
import '../api/config.dart';

class MessageLoadController extends GetxController {
  final String url = Path.requestMessageLoad;
  // สร้างตัวแปร Rx สำหรับเก็บข้อมูลที่ได้รับมาจาก server
  var messageController = <Message>[].obs;

  @override
  void onInit() {
    fetchAllAndUpdate(); // เรียก method ใหม่ที่เพิ่ม update
    super.onInit();
  }

  Future fetchAll() async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        messageController.assignAll(
          res["Message"].map<Message>(
            (json) => Message.fromJson(json),
          ),
        );
      } else {
        print("Error Connect Server");
      }
    } catch (err) {
      print(err);
    }
  }

  Future fetchAllAndUpdate() async {
    await fetchAll(); // เรียก method fetchAll
    //* ใช้ update เพื่ออัพเดท state ให้เกิดการเปลี่ยนแปลงทันที
    update();
  }
}
