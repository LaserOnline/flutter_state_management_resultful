import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widget/home.dart';
import '../widget/login.dart';
import '../widget/message.dart';

class PageRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String message = '/message';

  static final routes = [
    GetPage(
      name: home,
      page: () => Home(),
    ),
    GetPage(
      name: login,
      page: () => Login(),
    ),
    GetPage(
      name: message,
      page: () => Message(),
    ),
  ];
}
