import 'package:flutter/material.dart';
import 'package:flutter_state_management_resultful/widget/home.dart';
import 'package:get/get.dart';
import 'widget/login.dart';
import './service/shared_preferences_service.dart';
import './routes/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferencesService = SharedPreferencesService();
  final bool isLogin = await SharedPreferencesService.getIsLoggedIn();
  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({Key? key, required this.isLogin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLogin == true ? '/home' : 'login',
      getPages: PageRoutes.routes,
    );
  }
}
